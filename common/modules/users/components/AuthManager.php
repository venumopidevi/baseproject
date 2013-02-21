<?php

/**
 * Custom auth manager
 */
class AuthManager extends CDbAuthManager {

    const Admin = "Admin";
    public function init() {

        // Run the parent
        parent::init();

        // Run only if we are not guests
        if (!Yii::app()->user->isGuest) {
            // Assign a role to the member only if we didn't assign one yet
            if (!$this->isAssigned(Yii::app()->user->role, Yii::app()->user->id)) {
                if ($this->assign(Yii::app()->user->role, Yii::app()->user->id)) {
                    $this->save();
                }
            }
        }
    }

    /*
     * Associate roles,task and operation to this user for this 
     * Copy auth items from  AuthItemChild  to AuthAssignment  and Admin can
     * select extra auth items also as every auth item is available in form as HTML element
     * URL : http://site.com/path/to/users/index/adduser
     */
    public function doAuthAssignmentViaAdmin($userId = 0) {
        $successFlag = false;
        // Loop through the roles and assign them
        $types = array('roles', 'tasks', 'operations');
        $lastID = $userId;
        foreach ($types as $type) {
          if (isset($_POST[$type]) && count($_POST[$type])) {
              $successFlag = true; // Recieved data from form
            foreach ($_POST[$type] as $others) {
              // assign if not assigned yet
              if (!Yii::app()->authManager->isAssigned($others, $lastID)) {
                $authItem = Yii::app()->authManager->getAuthItem($others);
                Yii::app()->authManager->assign($others, $lastID, $authItem->bizrule, $authItem->data);
              }
            }
          }
        }
        return $successFlag;

    }
    
    /*
     * Associate roles,task and operation to this user for this 
     * Copy auth items from AuthItemChild  to AuthAssignment only 
     * URL : http://site.com/path/to/users/register
     */
    public function doAuthAssignmentViaFront($userId = 0) {
        $successFlag = true;
        try{
            // Loop through the roles and assign them
            $authItem = Yii::app()->authManager->getAuthItem('member', null);
            Yii::app()->authManager->assign($authItem->name, $userId, $authItem->bizrule, $authItem->data);
            $this->assignChildItems($userId,$authItem);
            
        }catch(Exceptin $ex){
            $successFlag = false;
        }
        
        
        return $successFlag;

    }
    
    public function assignChildItems($userId,$authItem){
        
        $authItemsChildren = Yii::app()->authManager->getItemChildren($authItem->name, null);
        foreach($authItemsChildren as $objAuthChild){
            //Inserting operations
            Yii::app()->authManager->assign($objAuthChild->name, $userId, $objAuthChild->bizrule, $objAuthChild->data);
            $newChild = Yii::app()->authManager->getItemChildren($objAuthChild->name, null);
            if($newChild){
                $this->assignItems($userId,$newChild);
            }
       }
    }
            

}