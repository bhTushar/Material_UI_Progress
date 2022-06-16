/*
 * Copyright (C) 2021-22 Application Library Engineering Group
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

import router from '@system.router'
import { MaterialProgressBar, MaterialProgressStyle } from "@ohos/materialprogressbar"

@Entry
@Component
struct MaterialProgressBarSample {
  @State progress: number = 30
  @State indeterminate: boolean = false
  frameworkModel: MaterialProgressBar.MaterialModel = new MaterialProgressBar.MaterialModel().setStyle(MaterialProgressStyle.MaterialHorizontal)
    .setProgress(30)
    .setSecondProgress(60)
    .setColor(0x009688)
    .setSecondColor(0x9fc6c2)
    .setBgColor(0xd7d7d7)

  aboutToAppear() {
    setTimeout(() => {
      this.indeterminate = true
    }, 1000)
  }

  build() {
    Scroll() {

      Flex({ direction: FlexDirection.Column, }) {

        Text("Determinate Linear Progress")
          .fontSize(18)
          .margin(2)

        Flex({ direction: FlexDirection.Column }) {
          MaterialProgressBar({ mStyle: MaterialProgressStyle.MaterialHorizontal,
            modelBuild: {
              color: '#009688',
              secondColor: '#9fc6c2',
              secondProgress: 60,
              indeterminate : false,
              indeterminateAngle : false,
              bgColor: "#b3ddd9"
            } })
        }.width('100%')
        .height(20)
        .margin({ top: 20 })

        Text("Determinate Linear Progress (One cycle)")
          .fontSize(18)
          .margin(2)


        Flex({ direction: FlexDirection.Column }) {
          MaterialProgressBar({ mStyle: MaterialProgressStyle.MaterialHorizontal,
            modelBuild: {
              color: '#009688',
              indeterminate: true,
              secondColor: '#9fc6c2',
              secondProgress: 60,
              bgColor: "#b3ddd9"
            } })
        }.width('100%')
        .height(20)
        .margin({ top: 20 })

        Text("Determinate Linear Progress (Custom color)")
          .fontSize(18)
          .margin(2)


        Flex({ direction: FlexDirection.Column }) {
          MaterialProgressBar({ mStyle: MaterialProgressStyle.MaterialHorizontal,
            modelBuild: {
              color: '#ffac0b0b',
              secondColor: '#ffc16f6f',
              secondProgress: 60,
              bgColor: "#b3ddd9"
            } })
        }.width('100%')
        .height(20)
        .margin({ top: 20 })

        Text("Indeterminate Linear Progress")
          .fontSize(18)
          .margin(2)


        Flex({ direction: FlexDirection.Column }) {
          MaterialProgressBar({ mStyle: MaterialProgressStyle.MaterialHorizontal,
            modelBuild: {
              indeterminate : true,
              indeterminateAngle: true,
              color: '#009688',
              bgColor: "#b3ddd9"
            } })
        }.width('100%')
        .height(20)
        .margin({ top: 20 })

        Text("Indeterminate Linear Progress (Custom color)")
          .fontSize(18)
          .margin(2)


        Flex({ direction: FlexDirection.Column }) {
          MaterialProgressBar({ mStyle: MaterialProgressStyle.MaterialHorizontal,
            modelBuild: {
              indeterminateAngle: true,
              color: "#ff99a07f",
              bgColor: '#ffd6d30b',
            } })
        }.width('100%')
        .height(20)
        .margin({ top: 20 })

      }
      .width('100%')
      .padding({ top: 0, left: 10, right: 10, bottom: 50 })
      .margin({ top: 0, left: 0, right: 0, bottom: 50 })

    }.scrollable(ScrollDirection.Vertical).scrollBar(BarState.On)
    .width('100%')
    .height('100%')
    .padding({ top: 20, left: 10, right: 10, bottom: 50 })
  }
}