<?php
/* It keeps records of translated/non translated string 
 * for each language entered in TABLE `language`.
 */
class Message extends CActiveRecord {

  /**
   * @return Message
   */
  public static function model($className = __CLASS__) {
    return parent::model(__CLASS__);
  }

  /**
   * @return string Table name
   */
  public function tableName() {
    //return '{{Message}}';
    return 'Message';
  }

  /**
   * Grab language names by their keys
   */
  public function getLanguageNames($lang) {
    if (!$lang) {
      return Yii::t('global', 'All');
    }

    $names = array();

    foreach (explode(',', $lang) as $language) {
      $names[] = Yii::app()->params['languages'][$language];
    }

    return implode(', ', $names);
  }
  
  

}