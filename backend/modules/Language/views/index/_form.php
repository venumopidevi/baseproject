<?php
/* @var $this LanguageController */
/* @var $model Language */
/* @var $form CActiveForm */
?>

<div class="form">

  <?php
  $form = $this->beginWidget('CActiveForm', array(
    'id' => 'language-form',
    'enableAjaxValidation' => false,
    'htmlOptions' => array('enctype' => 'multipart/form-data'),
      ));
  ?>

  <p class="note">Fields with <span class="required">*</span> are required.</p>
  <?php
$flashMessages = Yii::app()->user->getFlashes();
if ($flashMessages) {
    echo '<ul class="flashes">';
    foreach($flashMessages as $key => $message) {
        echo '<li><div class="flash-' . $key . '">' . $message . "</div></li>\n";
    }
    echo '</ul>';
}
?>
  <?php echo $form->errorSummary($model); ?>

  <div class="row">
    <?php echo $form->labelEx($model, 'language_title'); ?>
    <?php echo $form->textField($model, 'language_title', array('size' => 60, 'maxlength' => 255)); ?>
    <?php echo $form->error($model, 'language_title'); ?>
  </div>

  <div class="row">
    <?php echo $form->labelEx($model, 'language_code'); ?>
    <?php echo $form->textField($model, 'language_code', array('size' => 60, 'maxlength' => 255)); ?>
    <?php echo $form->error($model, 'language_code'); ?>
  </div>

  <div class="row">
    <?php echo $form->labelEx($model, 'language_image'); ?>
    <?php echo $form->fileField($model, 'language_image', array('size' => 30)); ?>
    <?php echo $form->error($model, 'language_image'); ?>
  </div>

  <div class="row">
    <?php echo $form->labelEx($model, 'language_primary'); ?>
    <?php echo $form->dropDownList($model, 'language_primary', array('No' => "No", 'Yes' => "Yes")); ?>
    <?php echo $form->error($model, 'language_primary'); ?>
  </div>

  <div class="row">
    <?php echo $form->labelEx($model, 'language_status'); ?>
    <?php echo $form->dropDownList($model, 'language_status', array('Active' => "Active", 'Inactive' => "Inactive")); ?>
    <?php echo $form->error($model, 'language_status'); ?>
  </div>

  <div class="row buttons">
    <?php echo CHtml::submitButton($model->isNewRecord ? 'Create' : 'Save'); ?>
  </div>

  <?php $this->endWidget(); ?>

</div><!-- form -->