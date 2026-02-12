<?php

namespace App\Http\Controllers\Api\V1;

use App\Models\BangladeshiArea;
use App\Models\BangladeshiDistrict;
use App\Models\BangladeshiDivision;
use Illuminate\Http\Request;

class BangladeshLocationController extends ApiController
{
    public function divisions(Request $request)
    {
        $perPage = min((int) $request->query('per_page', 50), 200);
        $divisions = BangladeshiDivision::query()
            ->orderBy('name')
            ->paginate($perPage);

        return $this->paginated($divisions, 'Divisions retrieved');
    }

    public function districts(Request $request)
    {
        $perPage = min((int) $request->query('per_page', 50), 200);
        $query = BangladeshiDistrict::query()->with('division')->orderBy('name');

        if ($request->query('division_id')) {
            $query->where('division_id', $request->query('division_id'));
        }

        $districts = $query->paginate($perPage);

        return $this->paginated($districts, 'Districts retrieved');
    }

    public function areas(Request $request)
    {
        $perPage = min((int) $request->query('per_page', 50), 200);
        $query = BangladeshiArea::query()->with('district.division')->orderBy('name');

        if ($request->query('district_id')) {
            $query->where('district_id', $request->query('district_id'));
        }

        $areas = $query->paginate($perPage);

        return $this->paginated($areas, 'Areas retrieved');
    }
}
