<?php
/**
 * index.php
 *
 * @author: antonio ramirez <antonio@clevertech.biz>
 * Date: 7/22/12
 * Time: 8:30 PM
 */
?>
<?php echo Yii::t('global', 'This is About Us Page...'); ?><br />
<?php echo Yii::t('global', 'Hidden Brains'); ?>
<br />
<?php echo Yii::t('global', 'Admin'); ?>

<?php
echo "<br /><h1>Buttons</h1><br />";
$this->widget('bootstrap.widgets.TbButton', array(
  'label' => 'Primary',
  'type' => 'primary',
  'size' => 'large'
));
$this->widget('bootstrap.widgets.TbButton', array(
  'label' => 'Secondary',
  'size' => 'large'
// 'size' => 'small'
// 'size' => 'mini'
));
echo "<br /><h1>Single button group</h1><br />";
$this->widget('bootstrap.widgets.TbButtonGroup', array(
  'buttons' => array(
    array('label' => 'Left', 'url' => '#'),
    array('label' => 'Middel', 'url' => '#'),
    array('label' => 'Right', 'url' => '#')
  ),
));
echo "<br /><h1>Multiple button groups</h1><br />";
?>
<div class="btn-toolbar">
  <?php
  $this->widget('bootstrap.widgets.TbButtonGroup', array(
    'buttons' => array(
      array('label' => '1', 'url' => '#'),
      array('label' => '2', 'url' => '#'),
      array('label' => '3', 'url' => '#'),
      array('label' => '4', 'url' => '#'),
    ),
  ));
  ?>
  <?php
  $this->widget('bootstrap.widgets.TbButtonGroup', array(
    'buttons' => array(
      array('label' => '5', 'url' => '#'),
      array('label' => '6', 'url' => '#'),
      array('label' => '7', 'url' => '#'),
    ),
  ));
  ?>
  <?php
  $this->widget('bootstrap.widgets.TbButtonGroup', array(
    'buttons' => array(
      array('label' => '8', 'url' => '#'),
    ),
  ));
  ?>
</div>
<?php
echo "<br /><h1>Vertical button groups</h1><br />";
$this->widget('bootstrap.widgets.TbButtonGroup', array(
  'stacked' => true,
  'buttons' => array(
    array('buttonType' => 'button', 'url' => '#', 'icon' => 'align-left'),
    array('buttonType' => 'button', 'url' => '#', 'icon' => 'align-center'),
    array('buttonType' => 'button', 'url' => '#', 'icon' => 'align-right'),
    array('buttonType' => 'button', 'url' => '#', 'icon' => 'align-justify'),
  ),
));
echo "<br /><h1>Checkbox or radio button groups</h1><br />";
$this->widget('bootstrap.widgets.TbButtonGroup', array(
  'type' => 'primary',
  'toggle' => 'radio',
  'buttons' => array(
    array('label' => 'Left'),
    array('label' => 'Middle'),
    array('label' => 'Right'),
  ),
));

echo "<br /><h1>Button dropdown menus<br />";

$this->widget('bootstrap.widgets.TbButtonGroup', array(
  'size' => 'large', //  'small', 'mini'
  'type' => 'success', // '', 'primary', 'info', 'success', 'warning', 'danger' or 'inverse'
  'buttons' => array(
    array('label' => 'Inverse', 'items' => array(
        array('label' => 'Action', 'url' => '#'),
        array('label' => 'Another action', 'url' => '#'),
        array('label' => 'Something else', 'url' => '#'),
        '---',
        array('label' => 'Separate link', 'url' => '#'),
    )),
  ),
));

echo "<br /><h1>Split button dropdowns<br />";

$this->widget('bootstrap.widgets.TbButtonGroup', array(
  'type' => 'primary', // '', 'primary', 'info', 'success', 'warning', 'danger' or 'inverse'
  'buttons' => array(
    array('label' => 'Action', 'url' => '#'), // this makes it split :)
    array('items' => array(
        array('label' => 'Action', 'url' => '#'),
        array('label' => 'Another action', 'url' => '#'),
        array('label' => 'Something else', 'url' => '#'),
        '---',
        array('label' => 'Separate link', 'url' => '#'),
    )),
  ),
));

echo "<br /><h1>Dropup menus<br />";

$this->widget('bootstrap.widgets.TbButtonGroup', array(
  'htmlOptions' => array('class' => 'dropup'), // easy stuff
  'buttons' => array(
    array('label' => 'Action', 'url' => '#'),
    array('items' => array(
        array('label' => 'Action', 'url' => '#'),
        array('label' => 'Another action', 'url' => '#'),
        array('label' => 'Something else', 'url' => '#'),
        '---',
        array('label' => 'Separate link', 'url' => '#'),
    )),
  ),
));

echo "<br /><h1>Boxes<br />";

$this->widget('bootstrap.widgets.TbBox', array(
  'title' => 'Basic Box',
  'headerIcon' => 'icon-home',
  'content' => 'My Basic Content (you can use renderPartial here too :))' // $this->renderPartial('_view')
));
echo "<br /><h1>Advanced Content<br />";
?>
<?php
$box = $this->beginWidget('bootstrap.widgets.TbBox', array(
  'title' => 'Advanced Box',
  'headerIcon' => 'icon-th-list',
  // when displaying a table, if we include bootstra-widget-table class
  // the table will be 0-padding to the box
  'htmlOptions' => array('class' => 'bootstrap-widget-table')
    ));
?>
<table class="table">
  <thead>
    <tr>
      <th>#</th>
      <th>First name</th>
      <th>Last name</th>
      <th>Language</th>
      <th>Hours worked</th>
    </tr>
  </thead>
  <tbody>
    <tr class="odd">
      <td>1</td><td>Mark</td><td>Otto</td><td>CSS</td><td>10</td>
    </tr>
    <tr class="even">
      <td>2</td><td>Jacob</td><td>Thornton</td><td>JavaScript</td><td>20</td>
    </tr>
    <tr class="odd">
      <td>3</td><td>Stu</td><td>Dent</td><td>HTML</td><td>15</td>
    </tr>
  </tbody>
</table>
<?php $this->endWidget(); ?>
<?php
echo "<br /><h1>Basic tabs<br />";
$this->widget('bootstrap.widgets.TbTabs', array(
  'type' => 'tabs', // 'tabs' or 'pills'
  'tabs' => array(
    array('label' => 'Home', 'content' => 'Home Content', 'active' => true),
    array('label' => 'Profile', 'content' => 'Profile Content'),
    array('label' => 'Messages', 'content' => 'Messages Content'),
  ),
));

echo "<br /><h1>Basic pills<br />";
$this->widget('bootstrap.widgets.TbTabs', array(
  'type' => 'pills',
  'tabs' => array(
    array('label' => 'Home', 'content' => 'Home Content', 'active' => true),
    array('label' => 'Profile', 'content' => 'Profile Content'),
    array('label' => 'Messages', 'content' => 'Messages Content'),
  ),
));
echo "<br /><h1>Disabled state<br />";
$this->widget('bootstrap.widgets.TbTabs', array(
  'type' => 'pills',
  'tabs' => array(
    array('label' => 'Home', 'content' => 'Home Content'),
    array('label' => 'Profile', 'content' => 'Profile Content'),
    array('label' => 'Messages',
      'content' => 'Messages Content',
      'itemOptions' => array('class' => 'disabled')),
  ),
));
echo "<br /><h1>Stacked tabs<br />";
$this->widget('bootstrap.widgets.TbTabs', array(
  'type' => 'tabs',
  'stacked' => true,
  'tabs' => array(
    array('label' => 'Home', 'content' => 'Home Content', 'active' => true),
    array('label' => 'Profile', 'content' => 'Profile Content'),
    array('label' => 'Messages', 'content' => 'Messages Content'),
  ),
));
echo "<br /><h1>Stacked Pills<br />";
$this->widget('bootstrap.widgets.TbTabs', array(
  'type' => 'pills',
  'stacked' => true,
  'tabs' => array(
    array('label' => 'Home', 'content' => 'Home Content', 'active' => true),
    array('label' => 'Profile', 'content' => 'Profile Content'),
    array('label' => 'Messages', 'content' => 'Messages Content'),
  ),
));

echo "<br /><h1>Tabs with dropdowns<br />";
$this->widget('bootstrap.widgets.TbTabs', array(
  'type' => 'tabs',
  'tabs' => array(
    array('label' => 'Home', 'content' => 'Home Content', 'active' => true),
    array('label' => 'Profile', 'content' => 'Profile Content'),
    array('label' => 'DropDown', 'items' => array(
        array('label' => 'Item1', 'content' => 'Item1 Content'),
        array('label' => 'Item2', 'content' => 'Item2 Content')
    )),
    ))
);
echo "<br /><h1>Pills with dropdowns<br />";
$this->widget('bootstrap.widgets.TbTabs', array(
  'type' => 'pills',
  'tabs' => array(
    array('label' => 'Home', 'content' => 'Home Content', 'active' => true),
    array('label' => 'Profile', 'content' => 'Profile Content'),
    array('label' => 'DropDown', 'items' => array(
        array('label' => 'Item1', 'content' => 'Item1 Content'),
        array('label' => 'Item2', 'content' => 'Item2 Content')
    )),
    ))
);


//$this->widget('bootstrap.widgets.TbMenu', array(
//  'type' => 'list',
//  'items' => array(
//    array('label' => 'List header', 'itemOptions' => array('class' => 'nav-header')),
//    array('label' => 'Home', 'url' => '#', 'itemOptions' => array('class' => 'active')),
//    array('label' => 'Library', 'url' => '#'),
//    array('label' => 'Applications', 'url' => '#'),
//    array('label' => 'Another list header', 'itemOptions' => array('class' => 'nav-header')),
//    array('label' => 'Profile', 'url' => '#'),
//    array('label' => 'Settings', 'url' => '#'),
//    '',
//    array('label' => 'Help', 'url' => '#'),
//  )
//));
?>