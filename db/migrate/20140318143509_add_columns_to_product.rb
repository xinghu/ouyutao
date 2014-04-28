class AddColumnsToProduct < ActiveRecord::Migration
  def change

    remove_column :products, :speed
    remove_column :products, :torque
    remove_column :products, :power

    #品牌
    add_column :products, :brank, :string

    #一：控制器
    #轴数
    add_column :products, :zhou_num, :string
    #架构
    add_column :products, :arch, :string
    #支持数控CNC编程
    add_column :products, :cnc, :string
    #支持龙门同步方式
    add_column :products, :longmen, :string
    #支持GALVO整合
    add_column :products, :galvo, :string
    #支持PLC功能
    add_column :products, :plc, :string
    #现场总线类型
    add_column :products, :fieldbus, :string
    #控制指令
    add_column :products, :control, :string

    #二：驱动器
    #输出指令
    add_column :products, :output_instr, :string
    #持续电流
    add_column :products, :electricity, :string
    #支持电压
    add_column :products, :voltage, :string
    #支持现场总线类型
    add_column :products, :driver_fieldbus, :string

    #三：电机
    #电机类型
    add_column :products, :motor, :string
    #直线电机推力范围
    add_column :products, :linear_motor_range, :string
    #旋转电机类型
    add_column :products, :rotary_motor, :string
    #旋转电机持续扭矩范围
    add_column :products, :rotary_motor_range, :string
    #特殊应用
    add_column :products, :special_ap, :string

    #四：执行器
    #推力范围
    add_column :products, :thrust_range, :string

    #五、滑台和直线单元
    #驱动形式
    add_column :products, :driver, :string
    #导向形式
    add_column :products, :oriented_form, :string
    #特殊应用
    add_column :products, :slip_special_ap, :string


    #六、高精密定位平台
    #运动类型
    add_column :products, :sports, :string
    #驱动类型
    add_column :products, :driver_type, :string
    #轴承类型
    add_column :products, :bearing, :string
    #最大负载
    add_column :products, :max_load, :string
    #高精纳米推荐
    add_column :products, :nano_recommend, :string

    #七、减速机
    #精度
    add_column :products, :precision, :string
    #减速比
    add_column :products, :reduction_ratio, :string

    #八、测量反馈装置
    #运动形式
    add_column :products, :sports_type, :string

  end
end
