


{include file='user/main.tpl'}







	<main class="content">
		<div class="content-header ui-content-header">
			<div class="container">
				<h1 class="content-heading">W/O</h1>
			</div>
		</div>
		<div class="container">
			<div class="col-lg-12 col-sm-12">
				<section class="content-inner margin-top-no">
					
					<div class="card">
						<div class="card-main">
							<div class="card-inner">
								<p>Have any questions please go directly to the lower right corner of the + to submit a new question</p>
							</div>
						</div>
					</div>
					
					<div class="table-responsive">
						{$tickets->render()}
                        <table class="table">
                            <tr>
								<th>Operating</th>
                                <th>ID</th>
                                <th>Date</th>
                                <th>Title</th>
								<th>Status</th>
                            </tr>
                            {foreach $tickets as $ticket}
                                <tr>
									<td>
										<a class="btn btn-brand" href="/user/ticket/{$ticket->id}/view">View</a>
									</td>
                                    <td>#{$ticket->id}</td>
                                    <td>{$ticket->datetime()}</td>
                                    <td>{$ticket->title}</td>
									{if $ticket->status==1}
									<td>ON</td>
									{else}
									<td>OFF</td>
									{/if}
                                </tr>
                            {/foreach}
                        </table>
                        {$tickets->render()}
					</div>
					
					<div class="fbtn-container">
						<div class="fbtn-inner">
							<a class="fbtn fbtn-lg fbtn-brand-accent waves-attach waves-circle waves-light" href="/user/ticket/create">+</a>
							
						</div>
					</div>

							
			</div>
			
			
			
		</div>
	</main>






{include file='user/footer.tpl'}










