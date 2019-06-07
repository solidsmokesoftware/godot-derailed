# godot-derailed
A decoupled really abstract interface layer for Godot

Usage

1. Add DerailedManager.gd and DerailedClient.gd to your project

2. Create your own interface clients by extending DerailedClient.gd

3. Attach the manager and your clients to Nodes in your scene

4. Call the get_clients() method on your manager after all the client nodes have been created to start

Once the manager is attached to the client, it will:

1. receive input events, 

2. send them to the clients to process,

3. receive output events, 

4. and send them to the clients to process.
