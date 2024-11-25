<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-4 text-gray-800"><?= $title; ?></h1>

    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-body">
                    <form action="" method="post" id="disposisiForm">
                        <!-- input id untuk disposisi berdasar id -->
                        <input type="hidden" name="id_suratmasuk" value="<?= $suratmasuk['id_suratmasuk']; ?>">
                        <input type="hidden" name="pengirim" value="<?= $jabatan['nama_jabatan']; ?>">
                        <div id="dynamicForm">
                            <div class="form-group row">
                                <div class="col-md-5">
                                    <label for="unit">Nama Unit</label>
                                    <select class="form-control unit" name="unit[]" required>
                                        <option value=""> Pilih Unit</option>
                                        <?php foreach ($unit as $u) { ?>
                                            <option value="<?= $u['id_unit']; ?>"><?= $u['nama_unit']; ?></option>
                                        <?php } ?>
                                    </select>
                                </div>
                                <div class="col-md-5">
                                    <label for="jabatan">Nama Jabatan</label>
                                    <select class="form-control jabatan" name="jabatan[]" required>
                                        <option value=""> Pilih Jabatan</option>
                                    </select>
                                </div>
                                <div class="col-md-2 mt-4">
                                    <button type="button" class="btn btn-danger btn-remove">Hapus</button>
                                </div>
                            </div>
                        </div>
                        <button type="button" id="addMore" class="btn btn-success">Tambah Form</button>
                        <button type="submit" class="btn btn-primary float-right">Tambah</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

</div>
<!-- /.container-fluid -->

<script>
    // Menambahkan baris form baru
    document.getElementById('addMore').addEventListener('click', function() {
        const dynamicForm = document.getElementById('dynamicForm');
        const newRow = `
            <div class="form-group row">
                <div class="col-md-5">
                    <label for="unit">Nama Unit</label>
                    <select class="form-control unit" name="unit[]" required>
                        <option value=""> Pilih Unit</option>
                        <?php foreach ($unit as $u) { ?>
                            <option value="<?= $u['id_unit']; ?>"><?= $u['nama_unit']; ?></option>
                        <?php } ?>
                    </select>
                </div>
                <div class="col-md-5">
                    <label for="jabatan">Nama Jabatan</label>
                    <select class="form-control jabatan" name="jabatan[]" required>
                        <option value=""> Pilih Jabatan</option>
                    </select>
                </div>
                <div class="col-md-2 mt-4">
                    <button type="button" class="btn btn-danger btn-remove">Hapus</button>
                </div>
            </div>`;
        dynamicForm.insertAdjacentHTML('beforeend', newRow);
    });

    // Menghapus baris form
    document.addEventListener('click', function(e) {
        if (e.target && e.target.classList.contains('btn-remove')) {
            e.target.closest('.form-group').remove();
        }
    });

    // Fetch data jabatan berdasarkan unit
    document.addEventListener('change', function(e) {
        if (e.target && e.target.classList.contains('unit')) {
            const unitId = e.target.value;
            const jabatanDropdown = e.target.closest('.form-group').querySelector('.jabatan');
            fetch(`<?= base_url('disposisi/add_ajax_jabatan/') ?>${unitId}`)
                .then(response => response.text())
                .then(data => {
                    jabatanDropdown.innerHTML = data;
                });
        }
    });
</script>