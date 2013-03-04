<?php
/* @var $this UsersController */

$this->breadcrumbs = array(
  'Users',
);
?>
<div>
  <?php echo CHtml::link(Yii::t('adminmembers', 'Add User'), array('index/adduser'), array('class' => 'button')); ?>
</div>

<div><!-- Start Content Box -->

  <div>
      
    <?php    
    
    $this->widget('bootstrap.widgets.TbAlert');

    ?>
    <h3><?php echo Yii::t('adminmembers', 'Users'); ?> (<?php echo Yii::app()->format->number($count); ?>)</h3>
  </div> <!-- End .content-box-header -->

  <div>
    <?php echo CHtml::form(); ?>
    <table>
      <thead>
        <tr>
          <th style='width: 5%;'><input type="checkbox" /></th>
          <th style='width: 5%'>&nbsp;</th>
          <th style='width: 20%;'><?php echo $sort->link('username', Yii::t('adminmembers', 'Username')); ?></th>
          <th style='width: 25%;'><?php echo $sort->link('email', Yii::t('adminmembers', 'Email')); ?></th>
          <th style='width: 10%;'><?php echo $sort->link('role', Yii::t('adminmembers', 'Role')); ?></th>
          <th style='width: 20%;'><?php echo $sort->link('joined', Yii::t('adminmembers', 'Joined')); ?></th>
          <th style='width: 15%;'><?php echo Yii::t('adminmembers', 'Options'); ?></th>
        </tr>
      </thead>
      <tfoot>
        <tr>
          <td colspan="7">	
            <div>
              <select name="bulkoperations">
                <option value=""><?php echo Yii::t('global', '-- Choose Action --'); ?></option>
                <option value="bulkdelete"><?php echo Yii::t('global', 'Delete Selected'); ?></option>
              </select>
              <?php echo CHtml::submitButton(Yii::t('global', 'Apply'), array('confirm' => Yii::t('adminmembers', 'Are you sure you would like to perform a bulk operation?'), 'class' => 'button')); ?>
            </div>

            <?php $this->widget('users.widgets.pager', array('pages' => $pages)); ?>
            <div class="clear"></div>
          </td>
        </tr>
      </tfoot>
      <tbody>
        <?php if (count($members)): ?>

          <?php foreach ($members as $row): ?>
            <tr>
              <td><?php echo CHtml::checkbox('user[' . $row->id . ']'); ?></td>
              <td>
                <?php $this->widget('users.widgets.VGGravatarWidget', array('email' => $row->email, 'size' => 20)); ?>
              </td>
              <td>
                <a href="<?php echo $this->createUrl('index/viewuser', array('id' => $row->id)); ?>">
                  <?php echo CHtml::encode($row->username); ?>
                </a>
              </td>
              <td>
                <?php echo CHtml::encode($row->email); ?>
              </td>
              <td>
                <?php echo CHtml::encode($row->role); ?>
              </td>
              <td>
                <?php echo Yii::app()->dateFormatter->formatDateTime($row->joined, 'short', 'short'); ?>
              </td>
              <td>
                <!-- Operation Icons -->
                <a href="<?php echo $this->createUrl('/users/index/edit', array('id' => $row->id)); ?>">Edit</a>
                <a href="<?php echo $this->createUrl('/users/index/delete', array('id' => $row->id)); ?>">Delete</a>
              </td>
            </tr>
          <?php endforeach ?>

        <?php else: ?>	
          <tr>
            <td colspan='6' style='text-align:center;'><?php echo Yii::t('adminmembers', 'No Members Found.'); ?></td>
          </tr>
        <?php endif; ?>
      </tbody>
    </table>
    <?php echo CHtml::endForm(); ?>
  </div> <!-- End .content-box-content -->

</div> <!-- End .content-box -->