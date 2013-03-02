<?php
class LanguageSelector extends CWidget
{
    public function run()
    {        
        $currentLang = Yii::app()->language;
        $languages = CHtml::listData(language::model()->findAll(array('select' => 'language_code, language_title')), 'language_code', 'language_title');
        
        $this->render('LanguageSelector', array('currentLang' => $currentLang, 'languages'=>$languages));
    }
}
?>
