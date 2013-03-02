<?php

/**
 * Controller.php
 *
 * @author: antonio ramirez <antonio@clevertech.biz>
 * Date: 7/23/12
 * Time: 12:55 AM
 */
class Controller extends CController {

  public $breadcrumbs = array();
  public $menu = array();

  public function beforeAction($action) {
      if (Yii::app()->user->id>0) {
      if(Yii::app()->user->role == Yii::app()->authManager->adminRole){
          return true;
      }
      $accessRulePrefix = 'backend_controllers';
      if(Yii::app()->controller->module){
          $appBase = substr(Yii::app()->basePath,0,strrpos(Yii::app()->basePath,'/')+1);
          $subject = Yii::app()->controller->module->controllerPath;
          $accessRulePrefix = str_replace(DIRECTORY_SEPARATOR,'_',str_replace($appBase, '', $subject));
      }
      $accessRule = 'op_'.$accessRulePrefix.'_' . Yii::app()->controller->id . '_' . $action->id;
      
      try {
        if (Yii::app()->user->checkAccess($accessRule)) {
          return true;
        }
        else {
          throw new CHttpException(403, Yii::t('global', 'Do not have such permissions.'));
        }
      } catch (Exception $ex) {
        $error['message'] = $ex->getMessage();
        $error['code'] = 403;
        $this->render('//site/error', $error);
      }
    }
    else {
      $this->redirect(Yii::app()->params->frontendurl . '/users/login');
    }
  }

}
