<?php

/**
 * main.php
 *
 * This file holds frontend configuration settings.
 *
 * @author: antonio ramirez <antonio@clevertech.biz>
 * Date: 7/22/12
 * Time: 5:48 PM
 */
$frontendConfigDir = dirname(__FILE__);

$root = $frontendConfigDir . DIRECTORY_SEPARATOR . '..' . DIRECTORY_SEPARATOR . '..';

$params = require_once($frontendConfigDir . DIRECTORY_SEPARATOR . 'params.php');

// Setup some default path aliases. These alias may vary from projects.
Yii::setPathOfAlias('root', $root);
Yii::setPathOfAlias('common', $root . DIRECTORY_SEPARATOR . 'common');
Yii::setPathOfAlias('backend', $root . DIRECTORY_SEPARATOR . 'backend');
Yii::setPathOfAlias('frontend', $root . DIRECTORY_SEPARATOR . 'frontend');
Yii::setPathOfAlias('www', $root . DIRECTORY_SEPARATOR . 'frontend' . DIRECTORY_SEPARATOR . 'www');

$mainLocalFile = $frontendConfigDir . DIRECTORY_SEPARATOR . 'main-local.php';
$mainLocalConfiguration = file_exists($mainLocalFile) ? require($mainLocalFile) : array();

$mainEnvFile = $frontendConfigDir . DIRECTORY_SEPARATOR . 'main-env.php';
$mainEnvConfiguration = file_exists($mainEnvFile) ? require($mainEnvFile) : array();

return CMap::mergeArray(
        array(
       'name' => 'Base Project',
      // @see http://www.yiiframework.com/doc/api/1.1/CApplication#basePath-detail
      'basePath' => 'frontend',
      
      // set parameters
      'params' => CMap::mergeArray($params, array(
      )),
      // preload components required before running applications
      // @see http://www.yiiframework.com/doc/api/1.1/CModule#preload-detail
      'preload' => array('bootstrap','log'),
      // @see http://www.yiiframework.com/doc/api/1.1/CApplication#language-detail      
      'language' => 'en',
      'sourceLanguage' => 'en',
      // uncomment if a theme is used
      'theme' => 'base',
      // setup import paths aliases
      // @see http://www.yiiframework.com/doc/api/1.1/YiiBase#import-detail
      'import' => array(
        'common.components.*',
        'common.extensions.*',
        'common.models.*',
        // uncomment if behaviors are required
        // you can also import a specific one
        /* 'common.extensions.behaviors.*', */
        // uncomment if validators on common folder are required
        /* 'common.extensions.validators.*', */
        'application.components.*',
        'application.controllers.*',
        'application.models.*'
      ),
      /* uncomment and set if required */
      // @see http://www.yiiframework.com/doc/api/1.1/CModule#setModules-detail
      'modules' => CMap::mergeArray($params['modules.common'], array(
          //specify  your frontend specific modules here
          )
      ),
      'components' => CMAP::mergeArray($params['components.common'], array(
        //specify our frontend specific components here
          /* load bootstrap components */
        'bootstrap' => array(
          'class' => 'common.extensions.bootstrap.components.Bootstrap',
          'responsiveCss' => true,
        ),
        'reqeust'=>array(
          'baseUrl' => 'http://'.$_SERVER['HTTP_HOST'].'/baseproject/',
        ),
        
        'errorHandler' => array(
          // @see http://www.yiiframework.com/doc/api/1.1/CErrorHandler#errorAction-detail
          'errorAction' => 'site/error'
        ),
        'db' => array(
          'connectionString' => $params['db.connectionString'],
          'username' => $params['db.username'],
          'password' => $params['db.password'],
          'tablePrefix' => $params['db.tablePrefix'],
          'schemaCachingDuration' => YII_DEBUG ? 0 : 86400000, // 1000 days
          'enableParamLogging' => YII_DEBUG,
          'charset' => 'utf8'
        ),
        'urlManager' => array(
          // Set the baseurl as we modified the .htaccess
          'baseurl' => 'http://'.$_SERVER['HTTP_HOST'].'/baseproject',
          'urlFormat' => 'path',
          'showScriptName' => false,
          'urlSuffix' => '/',
          'rules' => CMap::mergeArray($params['url.rules'], array(
            '<language:\w{2}>/' => 'site/index',
            '<language:\w{2}>/<module:\w+>/<controller:\w+>' => '<module>/<controller>/',
            '<language:\w{2}>/<module:\w+>/<controller:\w+>/<id:\d+>' => '<module>/<controller>/index',
            '<language:\w{2}>/<module:\w+>/<controller:\w+>/<action:\w+>/<id:\d+>' => '<module>/<controller>/<action>',
            '<language:\w{2}>/<module:\w+>/<controller:\w+>/<action:\w+>' => '<module>/<controller>/<action>',
            '<language:\w{2}>/<module:\w+>/<controller:\w+>/<action:\w+>' => '<module>/<controller>/<action>',
          )),
        ),
        
        
          /* make sure you have your cache set correctly before uncommenting */
          /* 'cache' => $params['cache.core'], */
          /* 'contentCache' => $params['cache.content'] */
      )),
        ), CMap::mergeArray($mainEnvConfiguration, $mainLocalConfiguration)
);