<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
  /**
   * The table associated with the model.
   *
   * @var string
   */
  protected $table = 'categories';
  /**
   * The attributes that are mass assignable.
   *
   * @var array
   */
  protected $fillable = ['name'];
  /**
   * Indicates if the model should be timestamped.
   *
   * @var bool
   */
  public $timestamps = true;
  /**
   * Get the blogs associated with the category.
   */
  public function blogs()
  {
      return $this->hasMany('App\Models\Blog');
  }
  /**
   * Get the categories associated with the category.
   */
  public function casestudies()
  {
      return $this->hasMany('App\Models\Casestudy');
  }
}