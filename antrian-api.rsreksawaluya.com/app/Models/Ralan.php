<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Ralan extends Model
{
    use HasFactory;
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'reg_periksa';
    /**
     * The connection name for the model.
     *
     * @var string
     */
    protected $connection = 'mysql2';
}
