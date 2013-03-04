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

  public function createMultilanguageReturnUrl($lang = 'en') {

    if (count($_GET) > 0) {
      $arr = $_GET;
      $arr['language'] = $lang;
    }
    else
      $arr = array('language' => $lang);
    return $this->createUrl('', $arr);
  }

  public function init() {

    Yii::import('backend.modules.Language.models.Language');
    Yii::app()->params->languages = Language::LanguageList();

    if (isset($_POST['language'])) {
      Yii::app()->language = $_POST['language'];
      $this->redirect(Yii::app()->baseUrl . '/' . Yii::app()->language);
    }

    if (isset($_GET['language'])) {
      Yii::app()->language = $_GET['language'];
    }

    parent::init();
  }

  public function beforeAction($action) {    
    $accessRulePrefix = 'frontend_controllers';
    if (Yii::app()->controller->module) {
      $appBase = substr(Yii::app()->basePath, 0, strrpos(Yii::app()->basePath, '/') + 1);
      $subject = Yii::app()->controller->module->controllerPath;
      $accessRulePrefix = str_replace(DIRECTORY_SEPARATOR, '_', str_replace($appBase, '', $subject));
    }
    $accessRule = 'op_' . $accessRulePrefix . '_' . Yii::app()->controller->id . '_' . $action->id;
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

}

