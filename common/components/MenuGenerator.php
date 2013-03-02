<?php

/*
 * To get the list of controllers and their methods 
 * available in frontend and backend
 */


class MenuGenerator extends CApplicationComponent {
    
    
    const FRONTEND = 'frontend';
    const BACKEND = 'backend';
    const TOKEN_APPROACH = 2; //get_all_token function will be used to get methods from controllers
    const REFLECTION_APPROACH = 1; //reflection class will be used to get methods from controllers
    
   
   
    /* Colleting controllers in common and application module(s)
     * RETURN : Array
     */
    public function getModulesList($moduleLocation = self::BACKEND)
    {
       $modules = array();
       $returnModules = array();
       if($moduleLocation == self::FRONTEND)
       {
           //gathering list of registered modules form froneend config
           $frontConfig = include (Yiibase::getPathOfAlias(self::FRONTEND.'.config.main').'.php');
           if(isset($frontConfig['modules'])){
               $modules = $frontConfig['modules'];
               
           }
           
       }else{
           //gettig backend application modules
           $modules = Yii::app()->getModules();
       }
       
       foreach($modules as $moduleName=>$m)
       {
           
           $returnModules[] = array('label'=>  ucwords($moduleName),'url'=>Yii::app()->params[self::BACKEND.'url'].DIRECTORY_SEPARATOR.$moduleName);
       }
           
   // print_r($returnModules);; exit;
       
       return $returnModules ;
    }
    
    
    
}
