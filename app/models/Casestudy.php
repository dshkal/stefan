<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Casestudy extends Model
{
  /**
   * The table associated with the model.
   *
   * @var string
   */
  protected $table = 'casestudies';
  /**
   * The attributes that are mass assignable.
   *
   * @var array
   */
  protected $fillable = ['name', 'content', 'category_id'];
  /**
   * Indicates if the model should be timestamped.
   *
   * @var bool
   */
  public $timestamps = true;
  /**
   * Get the category that belongs to this blog.
   */
  public function category()
  {
      return $this->belongsTo('App\Models\Category');
  }
}