/*
 * Copyright (C) 2022 Application Library Engineering Group
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import ProgressBar from './ProgressBar';

export default class CircularPath implements ProgressBar {
  private startPoint: number[];
  private endPoint: number[] = [0, 0];
  private angle: number = 0;
  private offsetAngle: number = 0;
  private radius: number = (100);
  private strokeWidth: string = '5vp';
  private pathCmd: string = '';
  progress: number = 0;
  color: Color;
  maxProgress: number = 100;
  private isReset: boolean = true;
  private strokewidth_a: number = parseInt(this.strokeWidth.substr(0, this.strokeWidth.length - 2))

  setAngle(angle: number): CircularPath{
    this.offsetAngle = angle;
    return this;
  }

  getAngle(): number{
    return this.offsetAngle;
  }

  setColor(color: Color): CircularPath{
    this.color = color;
    return this;
  }

  getColor(): Color{
    return this.color;
  }

  public setProgress(progress: number): CircularPath{
    this.progress = Math.max(0, Math.min(this.maxProgress, progress));
    this.update();
    return this;
  }

  public getProgress(): number{
    return this.progress;
  }

  setMaxProgress(max: number): CircularPath{
    this.maxProgress = max;
    return this;
  }

  getMaxProgress(): number{
    return this.maxProgress;
  }

  public setRadius(radius: number): CircularPath{
    this.radius = (radius);
    return this;
  }

  public setStrokeWidth(strokeWidth: string): CircularPath{
    this.strokeWidth = (strokeWidth);
    return this;
  }

  public getStrokeWidth(): string{
    return this.strokeWidth;
  }

  public getPathCmd(): string{
    return this.pathCmd;
  }

  public reset() {
    this.isReset = true;
  }

  private point2Str(point: number[]) {
    if (!point || point.length < 2) {
      return '';
    }
    return point[0] + ' ' + point[1];
  }

  private update() {
    if (this.isReset) {
      this.isReset = false;
    }
    this.startPoint = this.calculation(this.offsetAngle);
    this.angle = 360 * this.progress / this.maxProgress;
    let angle = this.angle == 360 ? 359 : this.angle;
    let endP = this.calculation(angle + this.offsetAngle);
    let close = this.progress == this.maxProgress ? 'Z' : '';

    let angleFlag = this.angle >= 180 ? 1 : 0;
    this.pathCmd = `M${this.point2Str(this.startPoint)} A${this.radius} ${this.radius} 0 ${angleFlag} 1 ${this.point2Str(endP)} ${close}`;
    this.endPoint = endP;
  }

  private calculation(angle: number): number[]{
    let radian = angle * Math.PI / 180;
    let circleRadius = this.radius + (this.strokewidth_a / 2);
    let endX = circleRadius + (this.radius * Math.sin(radian)) + this.strokewidth_a;
    let endY = circleRadius - (this.radius * Math.cos(radian)) + this.strokewidth_a;
    if ((circleRadius - 1) < endX && endX < circleRadius && (circleRadius - endX) < 0.01) {
      endX = circleRadius - 0.01;
    }
    return [endX, endY];
  }
}