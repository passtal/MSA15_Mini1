package board.util;

public class AddressUtils {

    public static String extractRegion(String address) {
        if (address == null || address.isBlank()) {
        	return "미지정";
        }

        String region = address.trim().split("\\s+")[0];

        return region
            .replace("특별시", "")
            .replace("광역시", "")
            .replace("도", "")
            .replace("시", "");
    }
}

