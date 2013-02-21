<?php

/**
 * params.php
 *
 * @author: antonio ramirez <antonio@clevertech.biz>
 * Date: 7/22/12
 * Time: 1:39 PM
 */
/**
 * Parameters shared by all applications.
 * Please put environment-sensitive parameters in env/params-{environmentcode}.php
 */
$commonConfigDir = dirname(__FILE__);

// get local parameters in
$commonParamsLocalFile = $commonConfigDir . DIRECTORY_SEPARATOR . 'params-local.php';
$commonParamsLocal = file_exists($commonParamsLocalFile) ? require ($commonParamsLocalFile) : array();

// if exists, include it, otherwise set as an empty array
$commonEnvParamsFile = $commonConfigDir . DIRECTORY_SEPARATOR . 'params-env.php';
$commonEnvParams = file_exists($commonEnvParamsFile) ? require($commonEnvParamsFile) : array();

return CMap::mergeArray(array(
      // cache settings -if APC is not loaded, then use CDbCache
      'cache.core' => extension_loaded('apc') ?
          array(
        'class' => 'CApcCache',
          ) :
          array(
        'class' => 'CDbCache',
        'connectionID' => 'db',
        'autoCreateCacheTable' => true,
        'cacheTableName' => 'cache',
          ),
      'cache.content' => array(
        'class' => 'CDbCache',
        'connectionID' => 'db',
        'autoCreateCacheTable' => true,
        'cacheTableName' => 'cache',
      ),
      // url rules needed by CUrlManager
      'url.rules' => array(
        '<controller:\w+>/<id:\d+>' => '<controller>/view',
        '<controller:\w+>/<action:\w+>/<id:\d+>' => '<controller>/<action>',
        '<controller:\w+>/<action:\w+>' => '<controller>/<action>',
      ),
      'php.exePath' => '/usr/bin/php',
      /*
       * Add our Common Components/Extensions here
       * @Added on 9 th Feb, 2013 - 4.38 PM.
       * Required: Specify QDP of our component/extension class
       */
      'components.common' => array(
        //specify  our common components here
        /*
         * Commonly used functions for filesystem objects manipulation 
         */
        'file' => array(
          'class' => 'common.extensions.cfile.CFile',
        ),
        /* if you are using Lanugage tranlation via Database [start] */
        //Comment this component if you are not using language translation or language module
        'messages' => array(
          'class' => 'CDbMessageSource',
          'cacheID' => 'cache',
        ),
        /* if you are using Lanugage tranlation [end] */
        /*
         * TWIG Template renderer[start]
         */
        'viewRenderer' => array(
          'class' => 'common.extensions.ETwigViewRenderer',
          'twigPathAlias' => 'common.extensions.Twig',
          // All parameters below are optional, change them to your needs
          // using .php is not recommended,either .html,.twig or .tpl
          'fileExtension' => '.twig', //template file extension
          'options' => array(
            'autoescape' => true,
          ),
          'globals' => array(
            'html' => 'CHtml'
          ),
          'functions' => array(
            'rot13' => 'str_rot13',
          ),
          'filters' => array(
            'jencode' => 'CJSON::encode',
          ),
        ),
        /*
         * TWIG Template renderer[End]
         */

        /* USER Module[start] */
        'email' => array(
          'class' => 'common.modules.users.extensions.mailer.EMailer',
          'pathViews' => 'common.modules.users.views.email',
          'pathLayouts' => 'common.modules.users.views.email.layouts'
        ),
        'func' => array(
          'class' => 'common.modules.users.components.Functions',
        ),
        'authManager' => array(
          'class' => 'common.modules.users.components.AuthManager',
          'connectionID' => 'db',
          'itemTable' => 'AuthItem',
          'itemChildTable' => 'AuthItemChild',
          'assignmentTable' => 'AuthAssignment',
          'defaultRoles' => array('guest'),
        ),
        'user' => array(
          'class' => 'common.modules.users.components.CustomWebUser',
          'allowAutoLogin' => true,
          'autoRenewCookie' => true,
          'identityCookie' => array('domain' => '.'),
        ),
      /* USER Module[end] */
      ),
      /*
       * Add our Common modules here
       * @Added on 5 th Feb, 2013 - 12.08 PM.
       * Required: Specify QDP of our Module class
       */
      'modules.common' => array(
        //specify  our common modules here
        'gii' => array(
          'class' => 'system.gii.GiiModule',
          'password' => 'clevertech',
          'generatorPaths' => array(
            'bootstrap.gii'
          )
        ),
        //Users Module
        'users' => array(
          'class' => 'common.modules.users.UsersModule',
        ),
      ),
        ), CMap::mergeArray($commonEnvParams, $commonParamsLocal));