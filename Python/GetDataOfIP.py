import requests
from bs4 import BeautifulSoup


def get_ip_info(ip_address):
    url = f"https://SomeUrl.com/{ip_address}"
    print(f"URL: {url}")

    try:
        response = requests.get(url)
        print(f"Response: {response.status_code}")

        if response.status_code == 200:
            soup = BeautifulSoup(response.text, 'html.parser')

            print(soup.prettify())

            # Extracting Location Data
            location_data_tag = soup.find('div', {'id': 'location'})
            location_data = location_data_tag.text.strip(
            ) if location_data_tag else "Not available"

            # Extracting Sender IP Reputation
            sender_ip_reputation_tag = soup.find(
                'div', {'id': 'sender-ip-reputation'})
            sender_ip_reputation = sender_ip_reputation_tag.text.strip(
            ) if sender_ip_reputation_tag else "Not available"

            return location_data, sender_ip_reputation
        else:
            return None, None
    except Exception as e:
        print(f"Error: {e}")
        return None, None


if __name__ == "__main__":
    ip_address = input("Enter the IP address: ")
    location_data, sender_ip_reputation = get_ip_info(ip_address)

    # if location_data is not None and sender_ip_reputation is not None:
    #     print(f"Location Data: {location_data}")
    #     print(f"Sender IP Reputation: {sender_ip_reputation}")
    # else:
    #     print("Failed to retrieve information.")
