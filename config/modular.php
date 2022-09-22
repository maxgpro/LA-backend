<?php
return [
    'path' => base_path() . '/app/Modules',
    'base_namespace' => 'App\Modules',
    'groupWithoutPrefix' => 'Pub',

    'groupMiddleware' => [
        'Admin' => [
            'web' => ['auth'],
            'api' => ['auth:api'],
        ]
    ],

    'modules' => [
        'Admin' => [
            'Analytics',
            'Dashboard',
            'Lead',
            'LeadComment',
            'Menu',
            'Role',
            'Sources',
            'Status',
            'Task',
            'TaskComments',
            'Unit',
            'User',
        ],

        'Pub' => [
            'Auth',
            'Analytics',
        ],
    ]
];
