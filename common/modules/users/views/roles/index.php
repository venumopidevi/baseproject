<div class='floatright'>
	<?php echo CHtml::link(Yii::t('adminroles', 'Add Auth Item'), array('roles/addauthitem'), array( 'class' => 'button' )); ?>
</div>

<div class="content-box"><!-- Start Content Box -->
	
	<div class="content-box-header">
		<h3><?php echo Yii::t('adminroles', 'Auth Items'); ?> (<?php echo $count; ?>)</h3>
	</div> <!-- End .content-box-header -->
	
	<div class="content-box-content">
		
		<table>
			<thead>
				<tr>
				   <th style='width: 20%'><?php echo $sort->link('name', Yii::t('adminroles', 'Name') ); ?></th>
				   <th style='width: 50%'><?php echo $sort->link('description', Yii::t('adminroles', 'Description') ); ?></th>
				   <th style='width: 10%'><?php echo $sort->link('type', Yii::t('adminroles', 'Type') ); ?></th>
				   <th style='width: 5%'><?php echo Yii::t('adminroles', 'Children'); ?></th>
				   <th style='width: 15%'><?php echo Yii::t('adminroles', 'Options'); ?></th>
				</tr>
			</thead>
			<tfoot>
				<tr>
					<td colspan="6">													
						<?php $this->widget('users.widgets.pager', array( 'pages' => $pages )); ?>
						<div class="clear"></div>
					</td>
				</tr>
			</tfoot>
			<tbody>
			<?php if ( count($rows) ): ?>
				
				<?php foreach ($rows as $row): ?>
					<tr>
						<td><a href="<?php echo $this->createUrl('roles/viewauthitem', array( 'parent' => $row->name )); ?>"><?php echo CHtml::encode($row->name); ?></a></td>
						<td><?php echo CHtml::encode($row->description); ?></td>
            <td><?php echo Yii::t('adminroles', AuthItem::model()->types[ $row->type ]); ?></td>
						<td><?php echo count(Yii::app()->authManager->getItemChildren($row->name)); ?></td>
						<td>
							<!-- Operation Icons -->
							<a href="<?php echo $this->createUrl('roles/addauthitemchild', array( 'parent' => $row->name )); ?>" title="<?php echo Yii::t('adminroles', 'Add auth child item'); ?>">Add auth child item</a>
							 <a href="<?php echo $this->createUrl('roles/editauthitem', array( 'id' => $row->name )); ?>" title="<?php echo Yii::t('adminroles', 'Edit this auth item'); ?>">Edit this auth item</a>
							 <a href="<?php echo $this->createUrl('roles/deleteauthitem', array( 'id' => $row->name )); ?>" title="<?php echo Yii::t('adminroles', 'Delete this auth item!'); ?>">Delete this auth item!</a>
						</td>
					</tr>
				<?php endforeach ?>

			<?php else: ?>	
				<tr>
					<td colspan='5' style='text-align:center;'><?php echo Yii::t('adminroles', 'No items found.'); ?></td>
				</tr>
			<?php endif; ?>
			</tbody>
		</table>
	
	</div> <!-- End .content-box-content -->
	
</div> <!-- End .content-box -->
