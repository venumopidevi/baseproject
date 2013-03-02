<div class="content-box"><!-- Start Content Box -->
	
	<div class="content-box-header">
		<h3><?php //echo $label; ?></h3>
	</div> <!-- End .content-box-header -->
	
	<div class="content-box-content">

		<?php echo CHtml::errorSummary($model); ?>
		<?php echo CHtml::form(); ?>
            <table class="table">
                <thead>
        <tr>
              <th><?php //echo CHtml::encode($row->parent); ?></th>
              <th width="25%"><?php echo CHtml::label(Yii::t('adminroles', 'Auth Item Name'), ''); ?></th>
              <th>
                <?php echo CHtml::label(Yii::t('adminroles', 'Auth Item Description'), ''); ?>
              </th>
              <th><?php echo CHtml::label(Yii::t('adminroles', 'Auth Item Type'), ''); ?></th>
              <th><?php echo CHtml::label(Yii::t('adminroles', 'Auth Item bizRule'), ''); ?></th>
              <th><?php echo CHtml::label(Yii::t('adminroles', 'Auth Item Data'), ''); ?></th>
        </tr>
      </thead>
      <?php
      $i = 0;
      $taskName = '';
      $taskSrNo = 0;
      if(isset($AuthItems)){
                    foreach($AuthItems as $AuthItem){ ?>
      <tr  style="<?php if($AuthItem->type==1) echo 'background-color:#2D6987' ;?>">
              
              <td>
                <?php echo CHtml::CheckBox('insert['.$i++.']',true, array ('value'=>'on',));
                                        
                ?>
              </td>
              <td width="25%" >
                    
                    <?php echo CHtml::activeTextField($AuthItem,'['.$i.']name', array( 'class' => 'text-input medium-input'));
                        

                          if($AuthItem->type == 0){
                              
                            echo CHtml::HiddenField('insertChild['.$i.']',$taskSrNo, array ('value'=>$taskSrNo,'class'=>'authItemChild_'.$taskSrNo));
                            
                          }else{
                              $taskName = $AuthItem->name;
                              $taskSrNo = $i;
                          }  
                    ?>
              </td>
              <td>
                  
                  <?php echo CHtml::activeTextField($AuthItem,'['.$i.']description', array( 'class' => 'text-input medium-input' )); ?></td>
              
              <td><?php echo CHtml::activeDropDownList($AuthItem,'['.$i.']type', AuthItem::model()->types, array('prompt' => Yii::t('global', '-- Choose Value --'), 'tabindex'=>3,  'class' => 'text-input medium-input' )); ?></td>
              <td><?php echo CHtml::activeTextArea($AuthItem,'['.$i.']bizrule', array( 'class' => 'text-input medium-input' )); ?></td>
              <td><?php echo CHtml::activeTextArea($AuthItem,'['.$i.']data', array( 'class' => 'text-input medium-input' )); ?></td>
        </tr>
          
		
                <?php   }  
                
                    }?>
            </table>
                <p><?php echo CHtml::submitButton(Yii::t('adminglobal', 'Submit'), array('class'=>'button')); ?></p>
		<?php echo CHtml::endForm(); ?>
		
	</div> <!-- End .content-box-content -->
	
</div> <!-- End .content-box -->
