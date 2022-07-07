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

import ProgressBar from './ProgressBar'

export default class LinearPath implements ProgressBar {
  private startPoint: number[] = [0, 0]
  private endPoint: number[] = [0, 0]
  private strokeWidth: string = '4vp'
  private pathCmd: string = ''
  progress: number;
  barColor: number;
  maxProgress: number = 100
  aboutToAppear() {
  }

  private update() {
    let end = 1000 * this.progress / this.maxProgress
    this.endPoint[0] = end;
    this.pathCmd = `M${this.point2Str(this.startPoint)} L${this.point2Str(this.endPoint)}`
  }

  private point2Str(point: number[]) {
    if (!point || point.length < 2) {
      return ''
    }
    return point[0] + ' ' + point[1]
  }

  setOffset(offset: number) {
    if (this.startPoint[0] != offset) {
      this.startPoint[0] = Math.max(0, offset)
      this.update()
    }
  }

  setBarColor(barColor: number): LinearPath{
    this.barColor = barColor
    return this;
  }

  getBarColor(): number{
    return this.barColor;
  }

  setMaxProgress(max: number): LinearPath{
    this.maxProgress = max
    return this;
  }

  getMaxProgress(): number{
    return this.maxProgress
  }

  setProgress(progress: number): LinearPath{
    if (progress !== this.progress) {
      this.progress = Math.max(0, Math.min(this.maxProgress, progress))
      this.update()
    }
    return this
  }

  getProgress(): number{
    return this.progress
  }

  public getPathCmd(): string{
    return this.pathCmd
  }
}