using Godot;
using System;

public class ship : KinematicBody2D
{
    [Export]
    public int moveSpeed = 60;
    public override void _Ready()
    {
        
    }

    public override void _PhysicsProcess(float delta)
    {
        var motion = new Vector2();

        motion.x = Input.GetActionRawStrength("move_right") - Input.GetActionRawStrength("move_left");
        motion.y = Input.GetActionRawStrength("move_down") - Input.GetActionRawStrength("move_up");

        MoveAndCollide(motion.Normalized() * moveSpeed * delta);
    
    }
}
