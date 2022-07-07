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

import MaterialComponent from './basic/MaterialComponents'
import MaterialProgressStyle from './materialprogressstyle'

@Component
struct MaterialProgressBar {
  @State mStyle: MaterialProgressStyle = MaterialProgressStyle.MaterialHorizontal
  modelBuild: any

  aboutToAppear() {
    this.modelBuild.style = this.mStyle
    if (this.mStyle != MaterialProgressStyle.MaterialHorizontal && this.mStyle != MaterialProgressStyle.MaterialCircular) {
      this.mStyle = MaterialProgressStyle.MaterialHorizontal
    }

  }

  onPageShow() {
  }

  build() {
    if (this.modelBuild) {
      MaterialComponent(this.modelBuild)
    }
  }
}

namespace MaterialProgressBar {
  export class MaterialModel {
    isReversed: boolean = false
    isMirror: boolean = false
    isGradients: boolean = false
    isStop: boolean = false
    progress: number = 30
    angle: number = 10
    style: MaterialProgressStyle = MaterialProgressStyle.MaterialHorizontal
    indeterminateAngle: boolean = false
    indeterminate: boolean = false
    radius: number = 50
    color: Color = 0x029789
    secondColor: Color = null
    secondProgress: number = 0
    bgColor: Color = null
    strokeWidth: string = '8vp'

    setSecondColor(secondColor: Color): MaterialModel{
      this.secondColor = secondColor
      return this
    }

    getSecondColor(): Color{
      return this.secondColor
    }

    setBgColor(bgColor: Color): MaterialModel{
      this.bgColor = bgColor
      return this
    }

    getBgColor(): Color{
      return this.bgColor
    }

    setShowProgressBackground(isShow: boolean): MaterialModel{
      if (isShow) {
        this.bgColor = 0xd0d0d0
      } else {
        this.bgColor = null
      }
      return this
    }

    getShowProgressBackground(): boolean{
      return this.bgColor == null
    }

    setColor(color: Color): MaterialModel{
      this.color = color
      return this
    }

    getColor(): Color{
      return this.color
    }

    setIndeterminate(indeterminate: boolean): MaterialModel{
      this.indeterminate = indeterminate
      return this
    }

    getIndeterminate(): boolean{
      return this.indeterminate
    }

    setIndeterminateAngle(indeterminateAngle: boolean): MaterialModel{
      this.indeterminateAngle = indeterminateAngle
      return this
    }

    getIndeterminateAngle(): boolean{
      return this.indeterminateAngle
    }

    setStyle(style: MaterialProgressStyle): MaterialModel{
      this.style = style
      return this
    }

    getStyle(): MaterialProgressStyle{
      return this.style
    }

    setProgress(progress: number): MaterialModel{
      this.progress = progress
      return this
    }

    getProgress(): number{
      return this.progress
    }

    setAngle(angle: number): MaterialModel{
      this.angle = angle
      return this
    }

    getAngle(): number{
      return this.angle
    }

    setRadius(radius: number): MaterialModel{
      this.radius = radius
      return this
    }

    getRadius(): number{
      return this.radius
    }

    setSecondProgress(secondProgress: number): MaterialModel{
      this.secondProgress = secondProgress
      return this
    }

    getSecondProgress(): number{
      return this.secondProgress
    }

    setStrokeWidth(strokeWidth: string): MaterialModel{
      this.strokeWidth = strokeWidth
      return this
    }

    getStrokeWidth(): string{
      return this.strokeWidth
    }
  }
}

export default MaterialProgressBar
