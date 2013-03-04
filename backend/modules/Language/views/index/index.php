<div class='floatright'>
  <?php 
  
  echo CHtml::link(Yii::t('adminlanguage', 'Add Language'), array('addlanguage'), array('class' => 'button')); ?>	
</div>

<div class="content-box"><!-- Start Content Box -->

  <div class="content-box-header">
    <h3><?php echo Yii::t('adminlang', 'Langauges'); ?></h3>
  </div> <!-- End .content-box-header -->

  <div class="content-box-content">
    <table>
      <thead>
        <tr>
          <th style='width: 5%;'>&nbsp;</th>
          <th style='width: 20%;'><?php echo Yii::t('adminlang', 'Language Key'); ?></th>
          <th style='width: 20%;'><?php echo Yii::t('adminlang', 'Language Title'); ?></th>
          <th style='width: 20%;'><?php echo Yii::t('adminlang', 'Source Language'); ?></th>
          <th style='width: 20%;'><?php echo Yii::t('adminlang', '# Strings'); ?></th>
          <th style='width: 15%;'><?php echo Yii::t('adminlang', 'Options'); ?></th>
        </tr>
      </thead>
      <tbody>

        <?php foreach ($languages as $value): ?>
          <tr>
            <td>&nbsp;</td>
            <td><?php echo $value->language_code; ?></td>
            <td><?php echo $value->language_title; ?></td>
            <td>
              <?php if ($value->language_code == Yii::app()->sourceLanguage): ?>              
                <img class='tooltip1' title='<?php echo Yii::t('adminlang', 'Source Language'); ?>' src="<?php echo Yii::app()->themeManager->baseUrl; ?>/images/icons/tick_circle.png" alt="Source Language" />
              <?php else: ?>
                <img class='tooltip1' title='<?php echo Yii::t('adminlang', 'Not Source Language'); ?>' src="<?php echo Yii::app()->themeManager->baseUrl; ?>/images/icons/cross_circle.png" alt="Not Source Language" />
              <?php endif; ?>		
            </td>
            <td>
              <?php if ($value->language_code == Yii::app()->sourceLanguage): ?>              
                <?php echo Yii::app()->format->formatNumber($totalStringsInSource); ?>
              <?php else: ?>
                <?php echo $this->getStringTranslationDifference($value->language_code) . ' / ' . Yii::app()->format->formatNumber(Message::model()->count('language=:key', array(':key' => $value->language_code))); ?>
              <?php endif; ?>		
            </td>
            <td width="50px"> 
              <!-- Icons -->							
              <?php if ($value->language_code == Yii::app()->sourceLanguage): ?>
              <?php // if ($value->language_code == Yii::app()->sourceLanguage): ?>
                &nbsp;<img class='tooltip11' title='<?php echo Yii::t('adminlang', 'Source cannot be translated'); ?>' src="<?php echo Yii::app()->themeManager->baseUrl; ?>/images/icons/information.png" alt="Translate" />
              <?php else: ?>
                <a style="opacity:1" href="<?php echo $this->createUrl('index/translate', array('id' => $value->language_code)); ?>" title="<?php echo Yii::t('adminlang', 'Translate this language'); ?>" class='tooltip1'>
                  &nbsp;<img src="<?php echo Yii::app()->themeManager->baseUrl; ?>/images/icons/pencil.png" alt="Translate" />
                </a>
                
                <a style="opacity:1" href="<?php echo $this->createUrl('index/translateneeded', array('id' => $value->language_code)); ?>" title="<?php echo Yii::t('adminlang', 'Translate only the strings that were not translated yet.'); ?>" class='tooltip1'>
                  &nbsp;<img src="<?php echo Yii::app()->themeManager->baseUrl; ?>/images/icons/pencil.png"  alt="Translate" />
                </a>

                <a style="opacity:1" href="<?php echo $this->createUrl('index/copystrings', array('id' => $value->language_code)); ?>" title="<?php echo Yii::t('adminlang', 'Copy missing language strings from source into this language'); ?>" class='tooltip1'>
                  &nbsp;<img src="<?php echo Yii::app()->themeManager->baseUrl; ?>/images/icons/copy.png" alt="copy" />
                </a>
                
                <?php echo CHtml::link(Yii::t('lang', 'Delete'), array($this->id.'/delete/id/'.$value->language_id)); ?>
              <?php endif; ?>	
            </td>
          </tr>	
        <?php endforeach; ?>	

      </tbody>
    </table>
  </div> <!-- End .content-box-content -->

</div> <!-- End .content-box -->
