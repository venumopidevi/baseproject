Language Module
 It provides managing panel for langaue so that 
 1) Admin can add and remove the languages from the system.
 2) Admin can update the language translation manually or 
 can get them from bing/frangely API.
 User will be choosing one language from the provided set and ultimately
 will update Yii::app()->language
 
 To get list of language selection UI(most probably in frontend)
 1) please add follwoing code in conig/main.php
 <<<code>>>
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
   <<<code>>>
 
  2) Define the following methods in applicationn.components.controller
   <<<code>>>  
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
  <<<code>>>
 * To get translation write your label/string as follows : <?php echo Yii::t('global', 'Admin'); ?>
 * Displaying Lanuage selection tool :
 <<<code>>>
    <?php $this->widget('common.widgets.LanguageSelector'); ?>
 <<<code>>>
  Please alter 'common' to the location where you have kept this widget.
               
 
