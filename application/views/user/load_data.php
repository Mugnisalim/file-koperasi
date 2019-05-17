<?php
if($keywords!=''){
	echo '<div class="alert alert-info">
			<div class="alert-content">
				<strong><i class="fa fa-search"></i>&nbsp;Pencarian :</strong> '.$keywords.'
			</div>
	</div>';
}
?>

<?php
if(count($result)>0){
?>
<table class="table table-striped table-hover fill-head">
    <thead>
	<?php
    $tpl_head = '<tr>';
	$tpl_head .= '<th>#</th>';
    foreach ($fields as $key_field => $val_field) {
		if ($sort_by == $key_field) {
			$class = 'sort-'.strtolower($sort_order).' sort-active';
		} else {
			$class = 'sort-desc sort-asc';
		}

		$sorting = (($sort_order == 'asc' && $sort_by == $key_field) ? 'desc' : 'asc');
		$anchor = '<a class="sorting '.$class.'" href="#" field="'.$key_field.'" name="'.$sorting.'">'.$val_field.'</a>';
		
       
    }
	$tpl_head .= '<th>Nama</th>';
    $tpl_head .= '<th>Username</th>';
    $tpl_head .= '<th>Level</th>';
    $tpl_head .= '<th><center>Aksi</center></th>';
    $tpl_head .= '</tr>';
    echo $tpl_head;
    ?>
    </thead>
    <tbody>
    <?php
	foreach($result as $result_key => $result_val){
	?>
        <tr id="row_<?=$result_val['id']?>">
            <td><?=($result_key+1)+$page?></td>
            <td><?=$result_val['name']?></td>
            <td><?=$result_val['username']?></td>
            <td><?=$result_val['description']?></td>
            <td>
            	<div align="center">
                	<a class="btn btn-primary btn-sm" href="<?=site_url('users/edit/id/'.$result_val['id'])?>">
                    <i class="fa fa-edit"></i> Edit
                    </a>
                    &nbsp;&nbsp;
                    <a class="btn btn-danger  btn-sm delete" field="<?=$result_val['id']?>" data-toggle="modal" data-target="#modal-confirm" title="Hapus">
                    <i class="fa fa-trash-o"></i> Hapus
                    </a>

                </div>
            </td>
        </tr>
    <?php
	}
	?>
    </tbody>
</table>
<?=$pagination?>
<!--Modal Confirm-->
<div id="modal-confirm" tabindex="-1" role="dialog" aria-hidden="true" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">Kamu Yakin?</div>
            <div class="modal-footer">
            	<input type="hidden" id="userid" />
                <button type="button" data-dismiss="modal" class="btn btn-default">Batal</button>
                <button type="button" data-dismiss="modal" class="btn btn-success btn-hapus">Ok</button>
            </div>
        </div>
    </div>
</div>

<?php
} else {
	echo '<div class="alert alert-warning">
			<div class="alert-content">
				<strong>Peringatan!</strong>
				Tidak ada data
			</div>
	</div>';
}
?>
