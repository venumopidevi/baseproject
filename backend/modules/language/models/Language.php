<?php

/**
 * This is the model class for table "language".
 *
 * The followings are the available columns in table 'language':
 * @property integer $language_id
 * @property string $language_title
 * @property string $language_code
 * @property string $language_image
 * @property string $language_primary
 * @property string $language_status
 */
class Language extends CActiveRecord {

  public $languageFlag;
  protected $_LanguageFileName = 'lang';

  /**
   * Returns the static model of the specified AR class.
   * @param string $className active record class name.
   * @return Language the static model class
   */
  public static function model($className = __CLASS__) {
    return parent::model($className);
  }

  /**
   * @return string the associated database table name
   */
  public function tableName() {
    return 'language';
  }

  /**
   * @return array validation rules for model attributes.
   */
  public function rules() {
    // NOTE: you should only define rules for those attributes that
    // will receive user inputs.
    return array(
      array('language_title, language_code, language_image', 'required'),
      array('language_primary', 'safe'),
      array('language_status', 'safe'),
      array('language_image', 'file', 'types' => 'jpg, gif, png'), //validate the Language image file extension
      // The following rule is used by search().
      // Please remove those attributes that should not be searched.
      array('language_id, language_title, language_code, language_image, language_primary, language_status', 'safe', 'on' => 'search'),
    );
  }

  /**
   * @return array relational rules.
   */
  public function relations() {
    // NOTE: you may need to adjust the relation name and the related
    // class name for the relations automatically generated below.
    return array(
    );
  }

  /**
   * @return array customized attribute labels (name=>label)
   */
  public function attributeLabels() {
    return array(
      'language_id' => 'Language',
      'language_title' => 'Language Title',
      'language_code' => 'Language Code',
      'language_image' => 'Language Image',
      'language_primary' => 'Language Primary',
      'language_status' => 'Language Status',
    );
  }

  /**
   * Retrieves a list of models based on the current search/filter conditions.
   * @return CActiveDataProvider the data provider that can return the models based on the search/filter conditions.
   */
  public function search() {
    // Warning: Please modify the following code to remove attributes that
    // should not be searched.

    $criteria = new CDbCriteria;

    $criteria->compare('language_id', $this->language_id);
    $criteria->compare('language_title', $this->language_title, true);
    $criteria->compare('language_code', $this->language_code, true);
    $criteria->compare('language_image', $this->language_image, true);
    $criteria->compare('language_primary', $this->language_primary, true);
    $criteria->compare('language_status', $this->language_status, true);

    return new CActiveDataProvider($this, array(
          'criteria' => $criteria,
        ));
  }

  /**
   * Create Language Directory if not exist.
   * If directory is creted successful, we will get directory path.
   * @param string $lang the language code
   */
  public function getLanguageDirectory($lang = '', $doCreateIfNotExist = true) {

    if ($lang != '') {

      $messageDirBasePath = Yiibase::getPathOfAlias('common.messages');
      $langDir = $messageDirBasePath . DIRECTORY_SEPARATOR . $lang;
      if (is_dir($langDir)) {
        return $langDir;
      }
      elseif ($doCreateIfNotExist) {
        //create lang directory

        $d = Yii::app()->file->set($langDir);

        if ($d->createDir('0777', $langDir)) {
          return $langDir;
        }
      }
    }
    return false;
  }

  /**
   * Create Language File if not exist.
   * If file is creted successful, we will get language file.
   * @param string $lang the language code
   */
  public function getLanguageFile($lang = '') {

    if ($lang != '') {
      $objFile = Yii::app()->file;
      $dirpath = $this->getLanguageDirectory($lang) . DIRECTORY_SEPARATOR;
      $langFile = $dirpath . $this->_LanguageFileName . '.php';
      $f = Yii::app()->file->set($langFile, true);

      if (!file_exists(Yiibase::getPathOfAlias($langFile))) {
        if (!$f->create()) {
          return false;
        }
      }
      // $f->setPermissions(0755);
      return $langFile;
    }
    return false;
  }

  /**
   * Delete Language File & Directory.
   * @param string $lang the language code
   */
  function deleteLanguageFile($lang) {

    $dirpath = $this->getLanguageDirectory($lang, false) . DIRECTORY_SEPARATOR;

    if (Yii::app()->file->set($dirpath)->exists) {
      $f = Yii::app()->file->set($dirpath);
      $del = $f->delete(true);
    }
  }

}