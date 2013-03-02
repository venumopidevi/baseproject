<?php

/*
 * To get the list of controllers and their methods 
 * available in frontend and backend
 */


class AutoList extends CApplicationComponent {
    
    public $controllersStr = 'controllers';
    public $authTaskPrefix = 'task_';
    public $authOperationPrefix = 'op_';
    public $ROLE = 2;
    public $TASK = 1;
    public $OPERATION = 0;
    const FRONTEND = 'frontend';
    const BACKEND = 'backend';
    const TOKEN_APPROACH = 2; //get_all_token function will be used to get methods from controllers
    const REFLECTION_APPROACH = 1; //reflection class will be used to get methods from controllers
    
    /* Provides the list of controllers available in the application
    */
    public function getControllerList($filePathAlias = '',$flgGetAction = false,$fetchingApproach = self::REFLECTION_APPROACH){
        
        //echo $filePathAlias,'<br/>';
        $controllerList = array();
        $fileLists = array();
        $defaultAlias = 'application.'.$this->controllersStr;
        try{
            
            if($filePathAlias !='') $defaultAlias = $filePathAlias; 

            $appControllerPath = Yii::getPathOfAlias($defaultAlias);
            
            //checking existence of controllers directory
            if(is_dir($appControllerPath))
                $fileLists = CFileHelper::findFiles($appControllerPath);
            
            
            foreach($fileLists as $controllerPath)
            { 
                
                if(strpos($controllerPath,'Controller.php')){
                    $controllerName = substr($controllerPath,  strrpos($controllerPath, DIRECTORY_SEPARATOR)+1,-4); 
                    $controllerPath =    str_replace('Controller.php','',substr($controllerPath,strpos($controllerPath,$this->controllersStr)+strlen($this->controllersStr)));
                    $controllerAlias = $defaultAlias.str_replace(DIRECTORY_SEPARATOR,'.',strtolower($controllerPath));
                    $controllerAliasInc = substr($controllerAlias,0,strrpos($controllerAlias,'.')+1);
                    $controllerAlias = str_replace('.','_',strtolower($controllerAlias));
                    
                    //if class is not in scope
                    Yii::import($controllerAliasInc.'*');
                    //include(Yiibase::getPathOfAlias($controllerAliasInc).DIRECTORY_SEPARATOR.$controllerName.'.php');
                    $controllerBasePath = Yiibase::getPathOfAlias($controllerAliasInc).DIRECTORY_SEPARATOR.$controllerName;
                    $controllerList[] = array('controller'=>$this->authTaskPrefix.$controllerAlias,'action'=>$this->getActionList($controllerName,$this->authOperationPrefix.$controllerAlias.'_',$controllerBasePath,$fetchingApproach),'type'=>$this->TASK);
                } 
            }
        }catch(Exception $ex){
            //$ex->getMessage();
            
            $controllerList = array();
        }
        
        return $controllerList;   
    }
    
    /* Provides the list of actions available in the given controller class
     * @parmas controllerPath : Path of the controller class
     */
     public function getActionList($controllerClassName,$prefixAction='',$controllerBasePath,$approachType = self::TOKEN_APPROACH){
        try{
            $className = $controllerClassName; 
            
            $arr = token_get_all(file_get_contents($controllerBasePath.'.php'));
            $pattern = '/^action\w{2,}/';
            $listMethods = array();

            if($approachType == self::TOKEN_APPROACH){
               foreach($arr as $m)
               {
                   if (isset($m[1]) && preg_match($pattern, $m[1])) {
                       //removing action from action name e.g. actionIndex
                       //6 is starting point of string i.e. end of action in actionIndex
                       $listMethods[] = $prefixAction.strtolower(substr($m[1],6));
                   } 
               }
            }else{
                $class = new ReflectionClass($className);
                $methods = $class->getMethods(ReflectionMethod::IS_PUBLIC | ReflectionMethod::IS_FINAL);
                //we want method having prefix action and must have two characters after action 
                //because methods like actions() should be avoided

                foreach($methods as $m)
                {
                    if (preg_match($pattern, $m->name)) {
                        //removing action from action name e.g. actionIndex
                        //6 is starting point of string i.e. end of action in actionIndex
                        $listMethods[] = $prefixAction.strtolower(substr($m->name,6));
                    } 

                }
            }
         
        }catch(Exception $e){
            
        }
        
        return $listMethods;
    }
    
    /* Colleting controllers in common and application module(s)
     * RETURN : Array
     */
    public function getModulesControllers($moduleLocation = self::BACKEND)
    {
       $modules = array();
       if($moduleLocation == self::FRONTEND)
       {
           //gathering list of registered modules form froneend config
           $frontConfig = include (Yiibase::getPathOfAlias(self::FRONTEND.'.config.main').'.php');
           if(isset($frontConfig['modules'])){
               $modules = $frontConfig['modules'];
               foreach($modules as $modName=>$modArray ){
                   //removing system and common modules
                   if(strpos('#'.$modArray['class'], 'system.') || strpos('#'.$modArray['class'], 'common.')){
                       unset($modules[$modName]);
                   }else{
                       $modules[$modName]['class'] = str_replace('application.','frontend.',$modArray['class']);
                   }
               }
           }
           
       }else{
           //gettig backend application modules
           $modules = Yii::app()->getModules();
       }
      // print_r($modules);exit;
       $returnModules = array();
       $newModules = array();
       $pattern = '/^system\w+/';
       $systemStr = 'system';
       foreach($modules as $moduleName=>$module){
           //print_r($moduleName);
           if(isset($module['class']))
           {   
               
               //Removing system modules
               //Comment this decsion, if you want to include system modules also
               if (strpos(' '.$modules[$moduleName]['class'], $systemStr) == 1) {
                   unset($modules[$moduleName]);
                   continue;
                 //echo 1;  
               }else{
               #getting controllers of this module
               //1) substr : Removing xyzModule from class path
               //2) Adding controllers directory  
               $controllersPath = substr($module['class'], 0, strrpos($module['class'], '.')+1).$this->controllersStr;
               
               $module = $this->getControllerList($controllersPath,false,self::TOKEN_APPROACH);
               //merging controllers of different modules in single list
               $returnModules = CMap::mergeArray($returnModules, $module);
               
               }
           }
           
           
       }
       
       return $returnModules ;
    }
    
    /* Get list of controllers available in 
     * backend.controllers,frontend.controllers
     * and controllers from registered modules
     * of backend.modules & frontend.modules
     * @params flgGetAsobj : bool, if TRUE then return task/operation as individual object
     *                       if false then return  task/operation as ARRAY
     */
       public function getAllControllersList($flgGetAsobj = false, $existingItems=array()){
        //Controllers available in BACKEND
        $backendControllers = $this->getControllerList(self::BACKEND.'.'.$this->controllersStr);
        //Controllers available in FRONTEND
        $frontendControllers = $this->getControllerList(self::FRONTEND.'.'.$this->controllersStr,false,self::TOKEN_APPROACH);
        
        //Controllers available in modules of BACKEND
        $backendModulesControllers = $this->getModulesControllers(self::BACKEND);
        //Controllers available in modules of FRONTEND
        $frontendModulesControllers = $this->getModulesControllers(self::FRONTEND);
        
        //Merging FRONTEND & BACKEND controllers
        $appControllers =  CMAp:: mergeArray($frontendControllers,$backendControllers);
        $appModulesControllers =  CMAp:: mergeArray($backendModulesControllers,$frontendModulesControllers);
        
        //Getting set of all the controllers available in the BOILERPLATE
        $authData =  CMAp:: mergeArray($appControllers,$appModulesControllers);
        
        $returnData = array();
        if($flgGetAsobj){
            foreach ($authData as $data){
                //adding task i.e. controller
                $objAuth = new AuthItem;
                $objAuth->name = $data['controller'];
                $objAuth->description = $data['controller'];
                $objAuth->type = $data['type'];
                $returnData[] = $objAuth; 
                    
                
                //adding operation i.e. action 
                foreach ($data['action'] as $actionName){
                    $objAuth = new AuthItem;
                    $objAuth->name = $actionName;
                    $objAuth->description = $actionName;
                    $objAuth->type = 0;
                    $returnData[] = $objAuth;
                    
                    //adding operation i.e. action 
                }
                
            }
        }else{
            $returnData = $authData;
        }
        return $returnData;
    }
    
    
}
