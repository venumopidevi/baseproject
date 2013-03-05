<?php

class IndexController extends Controller {
  /**
   * Number or records to display on a single page
   */

  const PAGE_SIZE = 50;

  public $defaultAction = 'index';

  /**
   * Specifies the access control rules.
   * This method is used by the 'accessControl' filter.
   * @return array access control rules
   */
  public function accessRules() {
//    return array(
//      array('allow', // allow all users to perform 'index' and 'view' actions
//        'actions' => array('index', 'view'),
//        'users' => array('*'),
//      ),
//      array('allow', // allow authenticated user to perform 'create' and 'update' actions
//        'actions' => array('create', 'update'),
//        'users' => array('@'),
//      ),
//      array('allow', // allow admin user to perform 'admin' and 'delete' actions
//        'actions' => array('admin', 'delete'),
//        'users' => array('admin'),
//      ),
//      array('deny', // deny all users
//        'users' => array('*'),
//      ),
//    );
  }

  public function actionIndex() {

    if (isset($_POST['bulkoperations']) && $_POST['bulkoperations'] != '') {

      // Did we choose any values?
      if (isset($_POST['user']) && count($_POST['user'])) {
        // What operation we would like to do?
        switch ($_POST['bulkoperations']) {
          case 'bulkdelete':

            // Load members and delete them
            $members_deleted = Users::model()->deleteByPk(array_keys($_POST['user']));
            // Done
            Yii::app()->user->setFlash('success', Yii::t('adminmembers', '{count} users deleted.', array('{count}' => $members_deleted)));
            break;

          default:
            // Nothing
            break;
        }
      }
    }

    // Load members and display
    $criteria = new CDbCriteria;

    $count = Users::model()->count();
    // echo $count;exit;
    $pages = new CPagination($count);
    $pages->pageSize = self::PAGE_SIZE;

    $pages->applyLimit($criteria);

    $sort = new CSort('Users');
    $sort->defaultOrder = 'joined DESC';
    $sort->applyOrder($criteria);

    $sort->attributes = array(
      'id' => 'ID',
      'username' => 'username',
      'joined' => 'joined',
      'email' => 'email',
      'role' => 'role',
    );

    $members = Users::model()->findAll($criteria);

    $this->render('index', array('count' => $count, 'members' => $members, 'pages' => $pages, 'sort' => $sort));
  }

  /**
   * Add user action
   */
  public function actionadduser() {

    $model = new Users;

    if (isset($_POST['Users'])) {
      $model->attributes = $_POST['Users'];
      $model->scenario = 'register';

      if ($model->save()) {
        $lastID = Yii::app()->db->lastInsertID; //User ID 
        // Loop through the roles and assign them
        if (Yii::app()->authManager->doAuthAssignmentViaAdmin($lastID)) {
          Yii::app()->user->setFlash('success', Yii::t('adminmembers', 'User Added.'));
        }
        else {
          Yii::app()->user->setFlash('Error', Yii::t('adminmembers', 'User was Added but could assign rights.'));
        }

        $this->redirect(array('viewuser', 'id' => $model->id));
      }
    }

    $temp = Yii::app()->authManager->getAuthItems();

    $items = array(CAuthItem::TYPE_ROLE => array(), CAuthItem::TYPE_TASK => array(), CAuthItem::TYPE_OPERATION => array());
    if (count($temp)) {
      foreach ($temp as $item) {
        $items[$item->type][$item->name] = $item->name;
      }
    }

    $items_selected = array();
    $items_selected['roles'] = isset($_POST['roles']) ? $_POST['roles'] : '';
    $items_selected['tasks'] = isset($_POST['tasks']) ? $_POST['tasks'] : '';
    $items_selected['operations'] = isset($_POST['operations']) ? $_POST['operations'] : '';

    $this->breadcrumbs[Yii::t('adminmembers', 'Users')] = '../../index';
    $this->breadcrumbs[Yii::t('adminmembers', 'Adding User')] = '';
    // $this->pageTitle[] = Yii::t('adminmembers', 'Adding User');
    // Display form
    $this->render('user_form', array('items_selected' => $items_selected, 'items' => $items, 'model' => $model, 'label' => Yii::t('adminmembers', 'Adding User')));
  }

  /**
   * Update user action 
   */
  public function actionEdit() {

    if (isset($_GET['id']) && ($model = Users::model()->findByPk($_GET['id']) )) {
      if (isset($_POST['Users'])) {
        $model->attributes = $_POST['Users'];
        $model->scenario = 'update';
        if ($model->save()) {

          // Loop through the roles and assign them
          $types = array('roles', 'tasks', 'operations');
          $lastID = $model->id;
          $allitems = Yii::app()->authManager->getAuthItems(null, $lastID);

          if (count($allitems)) {
            foreach ($allitems as $allitem) {
              Yii::app()->authManager->revoke($allitem->name, $lastID);
            }
          }

          foreach ($types as $type) {
            if (isset($_POST[$type]) && count($_POST[$type])) {
              foreach ($_POST[$type] as $others) {
                // assign if not assigned yet
                if (!Yii::app()->authManager->isAssigned($others, $lastID)) {
                  $authItem = Yii::app()->authManager->getAuthItem($others);
                  Yii::app()->authManager->assign($others, $lastID, $authItem->bizrule, $authItem->data);
                }
              }
            }
          }

          Yii::app()->user->setFlash('success', Yii::t('adminmembers', 'User Updated.'));
          $this->redirect(array('index/viewuser', 'id' => $model->id));
        }
      }

      $temp = Yii::app()->authManager->getAuthItems();
      $items = array(CAuthItem::TYPE_ROLE => array(), CAuthItem::TYPE_TASK => array(), CAuthItem::TYPE_OPERATION => array());
      if (count($temp)) {
        foreach ($temp as $item) {
          $items[$item->type][$item->name] = $item->name;
        }
      }

      // Selected
      $temp_selected = Yii::app()->authManager->getAuthItems(null, $model->id);
      $items_selected = array();
      if (count($temp)) {
        foreach ($temp_selected as $item_selected) {
          $items_selected[$item_selected->type][$item_selected->name] = $item_selected->name;
        }
      }

      $model->password = '';

      $this->breadcrumbs[Yii::t('adminmembers', 'Users')] = '../../index';
      $this->breadcrumbs[Yii::t('adminmembers', 'Editing User')] = '';
      // $this->pageTitle[] = Yii::t('adminmembers', 'Editing User');
      // Display form
      $this->render('user_form', array('items_selected' => $items_selected, 'items' => $items, 'model' => $model, 'label' => Yii::t('adminmembers', 'Editing User')));
    }
    else {
      Yii::app()->user->setFlash('error', Yii::t('adminerror', 'Could not find that ID.'));
      $this->redirect(array('index'));
    }
  }

  /**
   * Delete user action
   */
  public function actionDelete() {

    if (isset($_GET['id']) && ( $model = Users::model()->findByPk($_GET['id']) )) {
      $model->delete();

      Yii::app()->user->setFlash('success', Yii::t('adminmembers', 'User Deleted.'));
      $this->redirect(array('index'));
    }
    else {
      $this->redirect(array('index'));
    }
  }

  /**
   * View user action
   */
  public function actionviewuser() {
    if (isset($_GET['id']) && ($model = Users::model()->findByPk($_GET['id']) )) {
      $this->breadcrumbs[Yii::t('adminmembers', 'Users')] = '../../index';
      $this->breadcrumbs[Yii::t('adminmembers', 'Viewing User')] = '';
      // $this->pageTitle[] = Yii::t('adminmembers', 'Viewing User');
      // Display
      $this->render('user_view', array('model' => $model, 'label' => Yii::t('adminmembers', 'Viewing User')));
    }
    else {
      Yii::app()->user->setFlash('error', Yii::t('adminerror', 'Could not find that ID.'));
      $this->redirect(array('index'));
    }
  }

  /**
   * Logs out the current user and redirect to homepage.
   */
  public function actionLogout() {
    Yii::app()->user->logout(true);
    Yii::app()->user->setFlash('success', Yii::t('members', 'You are now logged out.'));
    $this->redirect(Yii::app()->homeUrl, true);
  }

}