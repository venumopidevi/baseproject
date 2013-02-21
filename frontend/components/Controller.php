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
            
            if(isset($_POST['language']))
            { 
              Yii::app()->language = $_POST['language'];  
              $this->redirect(Yii::app()->baseUrl.'/'.Yii::app()->language);
            } 
            
            if(isset($_GET['language']))
            { 
              Yii::app()->language = $_GET['language'];  
              
            }
            
            parent::init();
        }

}
