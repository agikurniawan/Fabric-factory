<!-- Begin Page Content -->
    <div class="container-fluid">

        <!-- Page Heading -->
        <h1 class="h3 mb-2 text-gray-800">Persediaan Barang</h1>

        <!-- Example single danger button -->
        <?= $this->session->flashdata('message'); ?>
        <div class="btn-group">
            
            <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                Data Barang
            </button>
            <div class="dropdown-menu">
                <?php foreach ($jbahan as $ba) : ?>
                <a class="dropdown-item" href=""><?= $ba['bahan']?></a>
                <?php endforeach?>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#TambahDataModal">Tambah Data</a>
            </div>
        </div>
        
        <!-- DataTales Example -->
        <div class="card shadow mb-4 mt-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">Data Persediaan</h6>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th>Name (fabric)</th>
                            <th>Stock</th>
                            <th>Status</th>
                            <th>Sisa</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    
                    <tbody>
                    <?php foreach ($barang as $bar) : ?>
                        <tr>
                            <td><?= $bar['name']; ?></td>
                            <td><?= $bar['stock']; ?></td>
                            <td><?= $bar['status']; ?></td>
                            <td><?= $bar['sisa']; ?></td>
                            <td>
                                <a href="" class="badge badge-pill badge-success">Edit</a>
                                <a href="" class="badge badge-pill badge-danger">Delete</a>
                            </td>
                        </tr>
                    <?php endforeach;?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<!-- End of Main Content -->

<!-- Modal -->
<div class="modal fade" id="TambahDataModal" tabindex="-1" role="dialog" aria-labelledby="TambahDataModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="TambahDataModalLabel">Tambah Data</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="<?= base_url('gudang/persediaan'); ?>" method="post">
                <div class="modal-body">
                    <div class="form-group">
                        <input type="text" class="form-control" id="name" name="name" placeholder="Nama Bahan">
                    </div>
                    <div class="form-group">
                        <select id="bahan_id" name="bahan_id" class="form-control">
                                <option selected>Pilih Bahan ...</option>
                                <?php foreach ($jbahan as $ba) : ?>
                                <option value="<?= $ba['id']; ?>"><?= $ba['bahan']?></option>
                                <?php endforeach;?>
                        </select>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="stock" name="stock" placeholder="Stock">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="status" name="status" placeholder="Status">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="sisa" name="sisa" placeholder="sisa">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Tambah</button>
                </div>
            </form>
        </div>
    </div>  
</div>