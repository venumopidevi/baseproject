<?php

/**
 * Langauges controller Home page
 */
class IndexController extends CController {

  const PAGE_SIZE = 100;
  const PAGE_SIZE_LARGE = 500;
  public $breadcrumbs = array();
  public $pageTitle;
  /**
   * init
   */
  public function init() {
    parent::init();

    $this->breadcrumbs[Yii::t('adminlang', 'Languages')] = array('index');
     $this->pageTitle = Yii::t('adminlang', 'Languages');
  }

  /**
   * Shows list of language available in the system
   * URL :http://site.com/path/to/language/index
   */
  public function actionIndex() {

    $language = Language::model()->findAll();

    $totalStringsInSource = SourceMessage::model()->count();
    $this->render('index', array('languages' => $language, 'totalStringsInSource' => $totalStringsInSource));
  }

  /**
   * Translate the copied string in `Message` those are 
   * not translate yet.
   * URL : site.com/path/to/language/index/translateneeded/id/gu
   * @params id : Target Lanugage code 
   */
  public function actionTranslateneeded() {
   
    $id = Yii::app()->request->getParam('id', 0);

    // Check if it exists
    if (!in_array($id, array_keys(Yii::app()->params['languages']))) {
      Yii::app()->user->setFlash('error', Yii::t('adminlang', 'That language is not supported.'));
      $this->redirect(array('index'));
    }

    // Did we submit?
    if (isset($_POST['submit']) && $_POST['submit']) {
      // Update the strings
      if (isset($_POST['strings']) && count($_POST['strings'])) {
        foreach ($_POST['strings'] as $stringid => $stringvalue) {
          // Update each one
          Message::model()->updateAll(array('translation' => $stringvalue), 'language=:lang AND id=:id', array(':id' => $stringid, ':lang' => $id));
        }

        Yii::app()->user->setFlash('success', Yii::t('adminlang', 'Strings Updated.'));
      }
    }

    $ids = $this->getStringNotTranslated($id);
    
    $idsStr = implode(',', $ids);
    //if nothing is remaining to translate
    if($idsStr == '') $idsStr = 0;

    // Grab the language data
    $criteria = new CDbCriteria;
    $criteria->condition = 'language=:lang AND id IN ('.$idsStr.' )';
    $criteria->params = array(":lang" => $id);
    
    $count = Message::model()->count($criteria);
    
    $pages = new CPagination($count);
    $pages->pageSize = self::PAGE_SIZE_LARGE;
    $pages->applyLimit($criteria);

    $sort = new CSort('Message');
    $sort->defaultOrder = 'id ASC';
    $sort->applyOrder($criteria);
    $sort->attributes = array(
      'id' => 'id',
      'translation' => 'translation',
    );

    $strings = Message::model()->findAll($criteria);
    
    //$this->breadcrumbs[Yii::t('adminlang', 'Translate')] = array('');
    $this->pageTitle = Yii::t('adminlang', 'Translate');
    $this->render('strings', array('strings' => $strings, 'count' => $count, 'pages' => $pages, 'sort' => $sort));
  }

  /**
   * Show list of language lables for the selected language to update with new value(s)
   * or revert back to default value(s) i.e. stored in TABLE `SourceMessage` 
   * URL : site.com/path/to/language/index/translat/id/gu
   * @params id : Target Lanugage code  
   */
  public function actiontranslate() {
    
    $id = Yii::app()->request->getParam('id', 0);

    // Check if it exists
    if (!in_array($id, array_keys(Yii::app()->params['languages']))) {
      Yii::app()->user->setFlash('error', Yii::t('adminlang', 'That language is not supported.'));
      $this->redirect(array('index'));
    }

    // Did we submit?
    if (isset($_POST['submit']) && $_POST['submit']) {
      // Update the strings
      if (isset($_POST['strings']) && count($_POST['strings'])) {
        foreach ($_POST['strings'] as $stringid => $stringvalue) {
          // Update each one
          Message::model()->updateAll(array('translation' => $stringvalue), 'language=:lang AND id=:id', array(':id' => $stringid, ':lang' => $id));
        }

        Yii::app()->user->setFlash('success', Yii::t('adminlang', 'Strings Updated.'));
      }
    }

    // Grab the language data
    $criteria = new CDbCriteria;
    $criteria->condition = 'language=:lang';
    $criteria->params = array(":lang" => $id);

    $count = Message::model()->count('language=:lang', array(':lang' => $id));
    $pages = new CPagination($count);
    $pages->pageSize = self::PAGE_SIZE;

    $pages->applyLimit($criteria);

    $sort = new CSort('Message');
    $sort->defaultOrder = 'id ASC';
    $sort->applyOrder($criteria);

    $sort->attributes = array(
      'id' => 'id',
      'translation' => 'translation',
    );

    $strings = Message::model()->findAll($criteria);

    $this->breadcrumbs[Yii::t('adminlang', 'Translate')] = array('translate');
    $this->pageTitle = Yii::t('adminlang', 'Translate');

    $this->render('strings', array('strings' => $strings, 'count' => $count, 'pages' => $pages, 'sort' => $sort));
  }

  /**
   * Revert a selectedLanuage string to it's default values 
   * stored in TABLE `SourceMessage`
   * @params id : selected language 
   */
  public function actionrevert() {
    //Getting Language code
    $id = Yii::app()->request->getParam('id', 0);
    $string = Yii::app()->request->getParam('string', 0);


    // Check if it exists
    if (!in_array($id, array_keys(Yii::app()->params['languages']))) {
      Yii::app()->user->setFlash('error', Yii::t('adminlang', 'That language is not supported.'));
      $this->redirect(array('index'));
    }

    // Grab the string and source
    $source = SourceMessage::model()->findByPk($string);
    $stringdata = Message::model()->find('language=:lang AND id=:id', array(':id' => $string, ':lang' => $id));

    if ((!$source || !$stringdata)) {
      Yii::app()->user->setFlash('error', Yii::t('adminlang', 'That language string was not found.'));
      $this->redirect(array('index'));
    }

    // Update the stringdata based on the soruce
    Message::model()->updateAll(array('translation' => $source->message), 'language=:lang AND id=:id', array(':id' => $string, ':lang' => $id));

    Yii::app()->user->setFlash('success', Yii::t('adminlang', 'String Reverted.'));
    $this->redirect(array('index/translate', 'id' => $id));
  }

  /**
   * Copy missing language strings from TABLE `sourceMessage` into this language(in TABLE `Message`)
   * It must be applied just after adding new language into the system only.
   * @params id : Selected target Language
   */
  public function actioncopystrings() {
    $id = Yii::app()->request->getParam('id', 0);

    // Check if it exists
    if (!in_array($id, array_keys(Yii::app()->params['languages']))) {
      Yii::app()->user->setFlash('error', Yii::t('adminlang', 'That language is not supported.'));
      $this->redirect(array('index'));
    }

    // Grab all soruce language strings
    $sourcestrings = SourceMessage::model()->findAll();

    $totaladded = 0;

    if ($sourcestrings) {
      foreach ($sourcestrings as $string) {
        // Do we have it already?
        if (!Message::model()->exists('language=:lang AND id=:id', array(':lang' => $id, ':id' => $string->id))) {
          
          
          // Doesn't then add it
          $newstring = new Message;
          $newstring->id = $string->id;
          $newstring->language = $id;
//          echo $string->message; exit;
//          $string->message = 'Venu Gopal Mopidevi';
          // echo Yii::app()->sourceLanguage;exit;

          //$string->message = self::languageTranslation(Yii::app()->sourceLanguage, $id, $string->message);

          $newstring->translation = $string->message;
          $newstring->save();
          $totaladded++;
        }
      }
    }

    // Done
    Yii::app()->user->setFlash('success', Yii::t('adminlang', 'Copy completed! Total of {number} missing strings copied.', array('{number}' => $totaladded)));
    $this->redirect(array('index'));
  }

  /**
   * Get ids of translation that were not translated
   * @params language : Selected Language
   * Used in : actionTranslateneeded() Method
   * RETURNS : Array of ID of Non translated language strings 
   */
  private function getStringNotTranslated($language) {
    $origs = SourceMessage::model()->findAll();
    $translated = array();
    if (count($origs)) {
      foreach ($origs as $orig) {
        // Grab the translation from the messages table
        $message = Message::model()->find('language=:lang AND id=:id', array(':lang' => $language, ':id' => $orig->id));
        
        if ($message) {
           if ($message->translation == '' || $message->translation == $orig->message) {
            $translated[] = $message->id;
          }
        }
      }
    }
    
    return $translated;
  }

  /**
   * Get number of strings that were already translated
   * @params language : Selected Language
   * Used in : actionTranslateneeded() Method
   * RETURNS : Array of ID of translated language strings 
   */
  public function getStringTranslationDifference($language) {
    $origs = SourceMessage::model()->findAll();
    $translated = 0;
    if (count($origs)) {
      foreach ($origs as $orig) {
        // Grab the translation from the messages table
        $message = Message::model()->find('language=:lang AND id=:id', array(':lang' => $language, ':id' => $orig->id));
        if ($message) {
          if ($message->translation != $orig->message) {
            $translated++;
          }
        }
      }
    }
    return $translated;
  }

  /**
   * Add New Language into the system
   * URL : http://site.com/path/to/language/index/addlanguage
   * Added language will be reflected at 
   * http://site.com/path/to/language/index
   * and in widget : widgets.LanguageSelector i.e. used at
   * http://site.com/path/to/frontend/www/index
   */
  public function actionaddlanguage() {

    $model = new Language;
     
    if (isset($_POST['Language'])) {

      $model->attributes = $_POST['Language'];

      $langCode = $model->language_code;
      $langImage = CUploadedFile::getInstance($model, 'language_image');
      if(!is_null($langImage)){
          
            if (($pos = strrpos($langImage, '.')) !== false) {
              $extension = substr($langImage, $pos + 1);
            }

            $model->language_image = $langImage;

            $model->language_image->saveAs(Yii::app()->basePath . '/www/images/lang_flags/lang_' . $langCode . '.' . $extension);
            $model->language_image = 'lang_' . $langCode . '.' . $extension;

            // $model->getLanguageFile($langCode);    

            if ($model->save()) {
              Yii::app()->user->setFlash('success', Yii::t('adminlanguages', 'Language Added.'));
              $this->redirect(array('index'));
            }
            else if (isset($_POST['preview'])) {
              $model->attributes = $_POST['Language'];
            }
      }else{
          Yii::app()->user->setFlash('Error', Yii::t('Language Image', 'Please upload image for a language.'));
      }
    }


    $this->breadcrumbs[Yii::t('adminlanguages', 'Adding Language')] = '';
    $this->pageTitle = Yii::t('adminlanguages', 'Adding Language');

    // Display form
    $this->render('_form', array( 'model' => $model, 'label' => Yii::t('adminlanguages', 'Adding Language')));
  }
  
  /**
   * Deletes a particular Language from the system by 
   * URL : http://site.com/path/to/language/index/delete/id/ru
   * @param integer $id : ID of selcted Language 
   */
  public function actionDelete($id) {
    /*
     * Finds a single active record with the specified primary key.
     * @var mixed $id the ID of the model to be deleted
     */
    $langRow = Language::model()->findByPk($id);
    /*
     * Initializing the language code and flag
     */
    $langCode = $langRow->language_code;
    $langImage = $langRow->language_image;
    /*
     * Deleting the message string from Message table
    */
    $condition = " language=:language";
    $params = array("language"=>$langCode);
    Message::model()->deleteAll($condition,$params);

    /*
     * Call getInstance to retrieve the instance of an deleted file
     * Returns an instance of the specified file
     */
    $langRow->language_image = CUploadedFile::getInstance($langRow, 'language_image');
    /*
     * Deletes a file
     * @param string file path used to delete the image file
     * Returns TRUE on success or FALSE on failure. 
     */
    $flagPath = Yii::app()->basePath . "/www/images/lang_flags/" . $langImage;
    if(file_exists($flagPath))
    unlink($flagPath);

    /*
     * Deleting the Language Via Active Record
     */
    Language::model()->findByPk($id)->delete();

    // if AJAX request (triggered by deletion via admin grid view), we should not redirect the browser
    if (!isset($_GET['ajax']))
      $this->redirect(isset($_POST['returnUrl']) ? $_POST['returnUrl'] : array('index'));
  }
  
  
   /**
   * Get translation of string FROM API of 
   * BING.COM and FRENGLEY.COM
   * NOTE : 
   * 1) As it get data from API, it takes time 
   * 2) IF you use free account then there is limit on per day translations.
   */
  static function languageTranslation($src, $dest, $text, $fs = '', $chk = '') {
    $config['bingtransapi'] = "172BD46EDB335ECE5CAFB8C0AC789FFC1745BBBA";   // http://www.bing.com/developers/appids.aspx
    $config["languagetranslationusername"] = "id.email003";
    $config["languagetranslationpassword"] = "hb@hb003";
    $BING_TRANS_API = $config['bingtransapi'];
    $FRENGLY_TRANS_USERNAME = $config["languagetranslationusername"];
    $FRENGLY_TRANS_PASS = $config["languagetranslationpassword"];
    
        $dest = strtolower($dest);
        $src = strtolower($src);
// using bing translation api
        $appId = $config['bingtransapi'];
        $org_txt = $text;
        $text = urlencode($text);
        $txt = '';
// mymemory.translated.net/api
# http://mymemory.translated.net/api/get?q=Hello World!&langpair=en|it
        // echo "http://mymemory.translated.net/api/get?q=" . $text . "&langpair=$src|$dest"; exit;
        $trans = self::curl_get_file_contents("http://mymemory.translated.net/api/get?q=" . $text . "&langpair=$src|$dest");
        
        if (trim($trans) != '') {
            $resp = @ json_decode($trans, 1);
            $txt = (isset($resp['responseData']['translatedText'])) ? $resp['responseData']['translatedText'] : '';
        }
// Bing Translation Api
        if (($txt == '' || strtolower($txt) == strtolower($org_txt)) && trim($appId) != '' && ($fs == '' || $chk == 'y')) {
# echo '<hr/>'."http://api.microsofttranslator.com/v2/Http.svc/Translate?appId=" . $appId . "&text=" . $text . "&from=$src&to=$dest".'<hr/>';
            $trans = self::curl_get_file_contents("http://api.microsofttranslator.com/v2/Http.svc/Translate?appId=" . $appId . "&text=" . $text . "&from=$src&to=$dest");
            $tr = self::xml2array($trans, 1);
            $txt = (isset($tr['string']) && is_string($tr['string'])) ? $tr['string'] : '';
            $txt = trim($txt);
        }
        if ($chk == 'y') {
            $ntxt = $txt;
        }
// using frengly.com api
        if ($txt == '' || strtolower($txt) == strtolower($org_txt) || $chk == 'y') {
# echo '<hr/>'."http://www.frengly.com/controller?action=translateAnyAny&text=$text&s_langs=&lb_langs=$dest&dest=$dest&manualSrcLang=null&manualSrcLangLabel=null&action=none&crop_percent_size=100&input_convert_to=jpg&shipping=ar&wordSrc=$text&translated=&message=".'<hr/>';
            
            $username = $config['languagetranslationusername'];
            $password = $config['languagetranslationpassword'];
// $trans = file_get_contents("http://www.frengly.com/controller?action=translateREST&src=" . $src . "&dest=" . $dest . "&text=" . urlencode($text) . "&username=id.email003&password=hb@hb003");
// $trans = file_get_contents("http://www.frengly.com/controller?action=translateAnyAny&crop_percent_size=100&input_convert_to=jpg&manualSrcLang=null&manualSrcLangLabel=null&lb_langs=$dest&s_langs=$src&src=$src&dest=$dest&text=".urlencode($text)."&username=id.email003&password=hb@hb003&wordSrc=".urlencode($text)."&shipping=ar&message=&translated=");
# $trans = file_get_contents("http://www.frengly.com/controller?action=translateAnyAny&crop_percent_size=100&input_convert_to=jpg&manualSrcLang=null&manualSrcLangLabel=null&lb_langs=$dest&s_langs=$src&src=$src&dest=$dest&text=" . $text . "&username=" . $username . "&password=" . $password . "&wordSrc=" . $text . "&shipping=ar&message=&translated=");
# $trans = $this->curl_get_file_contents("http://www.frengly.com/controller?action=translateAnyAny&crop_percent_size=100&input_convert_to=jpg&manualSrcLang=null&manualSrcLangLabel=null&lb_langs=$dest&s_langs=$src&src=$src&dest=$dest&text=" . $text . "&username=" . $username . "&password=" . $password . "&wordSrc=" . $text . "&shipping=ar&message=&translated=");
            $trans = self::curl_get_file_contents("http://www.frengly.com/controller?action=translateAnyAny&text=$text&s_langs=&lb_langs=$dest&dest=$dest&manualSrcLang=null&manualSrcLangLabel=null&action=none&crop_percent_size=100&input_convert_to=jpg&shipping=ar&wordSrc=$text&translated=");
            $tr = self::xml2array($trans, 0);
            $txt = utf8_decode($tr['response']['content']);  // return $tr['root']['translation'];
            $txt = trim($txt);
            if (strtolower($txt) == strtolower($org_txt) || trim($txt) == '') {
                $trans = self::curl_get_file_contents("http://www.frengly.com/controller?action=translateREST&src=" . $src . "&dest=" . $dest . "&text=" . urlencode($text) . "&username=$FRENGLY_TRANS_USERNAME&password=$FRENGLY_TRANS_PASS");
                $tr = self::xml2array($trans, 0);
                if(isset($tr['root']['details']))
                    $txt = utf8_decode($tr['root']['details']['token']['dest']);  // return $tr['root']['translation'];
                else
                    $text = $tr['root']['translation'];
                $txt = trim($txt);
            }
        }
        if ($txt == '' && $fs != '') {
            $trans = self::curl_get_file_contents("http://api.microsofttranslator.com/v2/Http.svc/Translate?appId=" . $appId . "&text=" . $text . "&from=$src&to=$dest");
            $tr = self::xml2array($trans, 1);
            $txt = (isset($tr['string']) && is_string($tr['string'])) ? $tr['string'] : '';
            $txt = trim($txt);
        }
        if ($chk == 'y' && trim($ntxt) != trim($txt) && trim($ntxt) != '') {
            $txt = $ntxt;
        }
//
        return $txt;
    }
    
    static function curl_get_file_contents($URL) {
      // echo "Hello";exit;
        $c = curl_init();
        curl_setopt($c, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($c, CURLOPT_URL, $URL);
        $contents = curl_exec($c);
        curl_close($c);
        if ($contents) {
            return $contents;
        }
        return FALSE;
    }
    
    /* It converts XML into ARRAY
     * Used in : languageTranslation() METHOD
     * @params contents : XML data to be converted into ARRAY
     * @params get_attributes : FLag either get attributes for each XML tag or not
     * @params priority : Set priority to node type
     */
    static function xml2array($contents, $get_attributes = 1, $priority = 'tag') {
        $parser = xml_parser_create('');
        xml_parser_set_option($parser, XML_OPTION_TARGET_ENCODING, "UTF-8");
        xml_parser_set_option($parser, XML_OPTION_CASE_FOLDING, 0);
        xml_parser_set_option($parser, XML_OPTION_SKIP_WHITE, 1);
        xml_parse_into_struct($parser, trim($contents), $xml_values);
        xml_parser_free($parser);
        if (!$xml_values) {
            return; //
        }
        $xml_array = array();
        $parents = array();
        $opened_tags = array();
        $arr = array();
        $current = & $xml_array;
        $repeated_tag_index = array();
        foreach ($xml_values as $data) {
            unset($attributes, $value);
            extract($data);
            $result = array();
            $attributes_data = array();
            if (isset($value)) {
                if ($priority == 'tag')
                    $result = $value;
                else
                    $result['value'] = $value;
            }
            if (isset($attributes) and $get_attributes) {
                foreach ($attributes as $attr => $val) {
                    if ($priority == 'tag')
                        $attributes_data[$attr] = $val;
                    else
                        $result['attr'][$attr] = $val; //Set all the attributes in a array called 'attr'
                }
            }
            if ($type == "open") {
                $parent[$level - 1] = & $current;
                if (!is_array($current) or (!in_array($tag, array_keys($current)))) {
                    $current[$tag] = $result;
                    if ($attributes_data)
                        $current[$tag . '_attr'] = $attributes_data;
                    $repeated_tag_index[$tag . '_' . $level] = 1;
                    $current = & $current[$tag];
                }
                else {
                    if (isset($current[$tag][0])) {
                        $current[$tag][$repeated_tag_index[$tag . '_' . $level]] = $result;
                        $repeated_tag_index[$tag . '_' . $level]++;
                    } else {
                        $current[$tag] = array(
                            $current[$tag],
                            $result
                        );
                        $repeated_tag_index[$tag . '_' . $level] = 2;
                        if (isset($current[$tag . '_attr'])) {
                            $current[$tag]['0_attr'] = $current[$tag . '_attr'];
                            unset($current[$tag . '_attr']);
                        }
                    }
                    $last_item_index = $repeated_tag_index[$tag . '_' . $level] - 1;
                    $current = & $current[$tag][$last_item_index];
                }
            } elseif ($type == "complete") {
                if (!isset($current[$tag])) {
                    $current[$tag] = $result;
                    $repeated_tag_index[$tag . '_' . $level] = 1;
                    if ($priority == 'tag' and $attributes_data)
                        $current[$tag . '_attr'] = $attributes_data;
                }
                else {
                    if (isset($current[$tag][0]) and is_array($current[$tag])) {
                        $current[$tag][$repeated_tag_index[$tag . '_' . $level]] = $result;
                        if ($priority == 'tag' and $get_attributes and $attributes_data) {
                            $current[$tag][$repeated_tag_index[$tag . '_' . $level] . '_attr'] = $attributes_data;
                        }
                        $repeated_tag_index[$tag . '_' . $level]++;
                    } else {
                        $current[$tag] = array(
                            $current[$tag],
                            $result
                        );
                        $repeated_tag_index[$tag . '_' . $level] = 1;
                        if ($priority == 'tag' and $get_attributes) {
                            if (isset($current[$tag . '_attr'])) {
                                $current[$tag]['0_attr'] = $current[$tag . '_attr'];
                                unset($current[$tag . '_attr']);
                            }
                            if ($attributes_data) {
                                $current[$tag][$repeated_tag_index[$tag . '_' . $level] . '_attr'] = $attributes_data;
                            }
                        }
                        $repeated_tag_index[$tag . '_' . $level]++; //0 and 1 index is already taken
                    }
                }
            } elseif ($type == 'close') {
                $current = & $parent[$level - 1];
            }
        }
        return ($xml_array);
    }
    
    
}