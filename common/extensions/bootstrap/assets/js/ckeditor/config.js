/**
 * Copyright (c) 2003-2012, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.html or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function( config ) {
    // Define changes to default configuration here. For example:
    // config.language = 'fr';
    // config.uiColor = '#AADC6E';
    config.skin = 'moono-light';
    // KCFinder 
    config.filebrowserBrowseUrl = ck_editor_url+'kcfinder/browse.php?type=files';
    config.filebrowserImageBrowseUrl = ck_editor_url+'kcfinder/browse.php?type=images';
    config.filebrowserFlashBrowseUrl = ck_editor_url+'kcfinder/browse.php?type=flash';
    config.filebrowserUploadUrl = ck_editor_url+'kcfinder/upload.php?type=files';
    config.filebrowserImageUploadUrl = ck_editor_url+'kcfinder/upload.php?type=images';
    config.filebrowserFlashUploadUrl = ck_editor_url+'kcfinder/upload.php?type=flash';

};

