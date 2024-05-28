<?php

namespace App\Models;

use App\Traits\HasUUID;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AntriPoli extends Model
{
    use HasFactory, HasUUID;
    /**
     * The connection name for the model.
     *
     * @var string
     */
    protected $connection = 'mysql';
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'antri_poli';
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['no_rawat', 'nm_dokter', 'poli_nomor', 'nm_pasien'];
    /**
     * The attributes that should be mutated to dates.
     *
     * @var array
     */
    protected $dates = ['created_at', 'updated_at', 'deleted_at'];
}
