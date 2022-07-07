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

import CircularComponent from './CircularComponent'
import LinearComponent from './LinearComponent'

enum MaterialProgressStyle {
  MaterialCircular,
  MaterialLinear,
}

@Component
struct MaterialComponent {
  @State progress: number = 30
  @State angle: number = 10
  style: MaterialProgressStyle = MaterialProgressStyle.MaterialLinear
  indeterminateAngle: boolean = false
  indeterminate: boolean = false
  @State radius: number = 50
  color: Color = 0x029789
  secondColor: Color = null
  secondProgress: number = 0
  bgColor: Color = null
  strokeWidth: string = '8vp'
  private strokewidth_a: number = parseInt(this.strokeWidth.substr(0, this.strokeWidth.length - 2))
  private offset: number = 0
  private intervalId: number
  private isAddProgress: boolean = true

  aboutToAppear() {

    if (this.indeterminate || this.indeterminateAngle) {
      this.intervalId = setInterval(() => {
        if (this.style == MaterialProgressStyle.MaterialCircular) {
          this.updateCircular()
        } else {
          this.updateLinear()
        }
      }, 30)
    }
  }

  aboutToDisappear() {
    if (this.intervalId) {
      clearInterval(this.intervalId)
    }
  }

  private updateLinear() {
    if (this.offset < 1000) {
      this.offset += 20
      this.progress += 4
    } else {
      this.offset = 0
      this.progress = 0
    }
  }

  private updateCircular() {

    if (this.indeterminateAngle) {
      this.angle = (this.angle + 5) % 360
      if (this.indeterminate) {
        if (this.isAddProgress) {
          this.progress = Math.min(100, this.progress + 2)
        } else {
          this.progress = Math.max(0, (this.progress - 20))
        }
        if (this.progress == 100 || this.progress == 0) {
          this.isAddProgress = !this.isAddProgress
        }

      }
    } else {
      if (this.indeterminate) {
        this.progress = (this.progress + 2) % 100
      }
    }
  }

  build() {
    if (this.indeterminateAngle) {
      if (this.style == MaterialProgressStyle.MaterialCircular) {
        Stack() {
          CircularComponent({
            progress: this.progress,
            secondProgress: this.secondProgress,
            color: this.color,
            secondColor: this.secondColor,
            bgColor: this.bgColor,
            radius: this.radius,
            strokeWidth: this.strokeWidth,
            angle: this.angle
          })
        }
        .width(this.radius * 2 + 4)
        .height(this.radius * 2 + 4)
      } else if (this.style == MaterialProgressStyle.MaterialLinear) {
        Stack() {
          LinearComponent({
            offset: this.offset,
            progress: this.progress,
            secondProgress: this.secondProgress,
            color: this.color,
            secondColor: this.secondColor,
            bgColor: this.bgColor,
            strokeWidth: this.strokeWidth
          })
        }
      }
    } else {
      Stack() {
        if (this.style == MaterialProgressStyle.MaterialCircular) {
          CircularComponent({
            progress: this.progress,
            secondProgress: this.secondProgress,
            color: this.color,
            secondColor: this.secondColor,
            bgColor: this.bgColor,
            radius: this.radius,
            strokeWidth: this.strokeWidth
          })
        } else if (this.style == MaterialProgressStyle.MaterialLinear) {
          LinearComponent({
            progress: this.progress,
            secondProgress: this.secondProgress,
            color: this.color,
            secondColor: this.secondColor,
            bgColor: this.bgColor,
            strokeWidth: this.strokeWidth
          })
        }
      }
    }
  }
}

export default MaterialComponent;
