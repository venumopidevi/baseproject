<?php

/**
 * Register controller class
 */
class RegisterController extends Controller {

  /**
   * Controller constructor
   */
  public function init() {
      
    // Do not allow logged in users here
    if (Yii::app()->user->id) {
      $this->redirect('index/index');
    }

    // Add page breadcrumb and title
    $this->breadcrumbs[Yii::t('global', 'Register')] = array('register/index');

    parent::init();
  }

  /**
   * List of available actions
   */
  public function actions() {
      
    return array(
      'captcha' => array(
        'class' => 'CCaptchaAction',
        'backColor' => 0xFFFFFF,
        'minLength' => 3,
        'maxLength' => 7,
        'testLimit' => 3,
        'padding' => array_rand(range(2, 10)),
      ),
    );
  }

  /**
   * Register action
   */
  public function actionindex() {
    $model = new RegisterForm;
    
    if (isset($_POST['RegisterForm'])) {      
      
      $model->attributes = $_POST['RegisterForm'];
      if ($model->validate()) {

        // Save the member and redirect
        $user = new Users;
        $user->scenario = 'register';
        $user->role = 'Member';
        $user->attributes = $_POST['RegisterForm'];
        $user->isNewRecord = true;

        if($user->save()){
            $lastID = Yii::app()->db->lastInsertID; //User ID 
            // Loop through the roles and assign them
            $temp_selected = Yii::app()->authManager->getAuthItems(null, $lastID);
            
            if(Yii::app()->authManager->doAuthAssignmentViaFront($lastID)){
                Yii::app()->user->setFlash('success', Yii::t('adminmembers', 'User Added.'));
            }else{
                Yii::app()->user->setFlash('Error', Yii::t('adminmembers', 'User was Added but could assign rights.'));
            }
        }
        
        // Redirect
        Yii::app()->user->setFlash('success', Yii::t('register', 'Registration Completed. Please sign in.'));
        $this->redirect(Yii::app()->baseUrl . '/users/login');
      }
      else {
        print_r($model->getErrors());
      }
    }
    //exit;
    $this->render('index', array('model' => $model));
  }

}