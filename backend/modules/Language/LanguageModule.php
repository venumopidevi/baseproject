<?php

/* It provides managing panel for langaue so that 
 * 1) Admin can add and remove the languages from the system.
 * 2) Admin can update the language translation manually or 
 * can get them from bing/frangely API.
 * User will be choosing one language from the provided set and ultimately
 * will update Yii::app()->language
 * 
 * To get list of language selection UI(most probably in frontend)
 * 1) please add follwoing code in conig/main.php

  urlManager=>array(
  'class' => 'alias.to.Language.components.UrlManager',
  'urlFormat' => 'path',
  'showScriptName' => false,
  'urlSuffix' => '/',
  'rules' => array('<language:(en|gu|ru|hi)>/' => 'site/index',
  '<language:(en|gu|ru|hi)>/<action:(contact|login|logout)>/*' => 'site/<action>',
  '<language:(en|gu|ru|hi)>/<controller:\w+>/<id:\d+>' => '<controller>/view',
  '<language:(en|gu|ru|hi)>/<controller:\w+>/<action:\w+>/<id:\d+>' => '<controller>/<action>',
  '<language:(en|gu|ru|hi)>/<controller:\w+>/<action:\w+>/*' => '<controller>/<action>',)
  ),
  ...
  ),
  language=>'en'
  sourceLanguage=>'en'
 * 
 * 2) Please define following methods in applicationn.components.controller

  class Controller extends CController {
  ...

  public function createMultilanguageReturnUrl($lang='en'){
  if (count($_GET)>0){
  $arr = $_GET;
  $arr['language']= $lang;
  }
  else
  $arr = array('language'=>$lang);
  return $this->createUrl('', $arr);
  }

  public function init(){
  Yii::import('backend.modules.Language.models.Language');
  Yii::app()->params->languages = Language::LanguageList();

  Yii::app()->language = $_GET['language'];
  parent::init();
  }
  }
 * To get translation write your label/string as follows : <?php echo Yii::t('global', 'Admin'); ?>
 * Displaying Lanuage selection tool :
 * <?php echo $this->widget('common.widget.LanuageSelector'); ?>
 * Please alter common to the location you have kept this widget

 * */

class LanguageModule extends CWebModule {

  public function init() {
    // this method is called when the module is being created
    // you may place code here to customize the module or the application
    $this->defaultController = 'index';
    // import the module-level models and components
    $this->setImport(array(
      'language.models.*',
      'language.components.*',
    ));
    Yii::app()->params->languages = Language::LanguageList();
  }

  public function beforeControllerAction($controller, $action) {
    if (parent::beforeControllerAction($controller, $action)) {
      // this method is called before any module controller action is performed
      // you may place customized code here
      return true;
    }
    else
      return false;
  }

}
