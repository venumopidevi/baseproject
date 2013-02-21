<?php
/* @var $this SiteController */
/* @var $model ContactForm */
/* @var $form CActiveForm */

$this->pageTitle = Yii::app()->name . ' - Contact Us';
$this->breadcrumbs = array(
  'Contact',
);
?>

<h1>Contact Us</h1>

<?php if (Yii::app()->user->hasFlash('contact')): ?>

  <div class="flash-success">
    <?php echo Yii::app()->user->getFlash('contact'); ?>
  </div>

<?php else: ?>

  <p>
    If you have business inquiries or other questions, please fill out the following form to contact us. Thank you.
  </p>

  <?php
  $form = $this->beginWidget('CActiveForm', array(
    'id' => 'contact-form',
    'enableClientValidation' => true,
    'clientOptions' => array(
      'validateOnSubmit' => true,
    ),
      ));
  ?>

  <p class="note">Fields with <span class="required">*</span> are required.</p>

  <?php echo $form->errorSummary($model); ?>


  <?php echo $form->labelEx($model, 'name'); ?>
  <?php echo $form->textField($model, 'name'); ?>
  <?php echo $form->error($model, 'name'); ?>
  <br />

  <?php echo $form->labelEx($model, 'email'); ?>
  <?php echo $form->textField($model, 'email'); ?>
  <?php echo $form->error($model, 'email'); ?>

  <br />

  <?php echo $form->labelEx($model, 'subject'); ?>
  <?php echo $form->textField($model, 'subject', array('size' => 60, 'maxlength' => 128)); ?>
  <?php echo $form->error($model, 'subject'); ?>
  <br />

  <?php echo $form->labelEx($model, 'body'); ?>
  <?php echo $form->textArea($model, 'body', array('rows' => 6, 'cols' => 50)); ?>
  <?php echo $form->error($model, 'body'); ?>

  <br />
  <?php if (CCaptcha::checkRequirements()): ?>

    <?php echo $form->labelEx($model, 'verifyCode'); ?>
    <?php echo $form->textField($model, 'verifyCode'); ?>
    <?php echo $form->error($model, 'verifyCode'); ?>
    <div class="hint">Please enter the letters as they are shown in the image above.
      <br/>Letters are not case-sensitive.</div>
    <?php $this->widget('CCaptcha'); ?>
  <?php endif; ?>
  <br />
  <?php echo CHtml::submitButton('Submit'); ?>
  <br />
  <?php $this->endWidget(); ?>

<?php endif; ?>