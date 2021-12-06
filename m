Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F9AB469648
	for <lists+nbd@lfdr.de>; Mon,  6 Dec 2021 14:06:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 58FEA205DF; Mon,  6 Dec 2021 13:06:12 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Dec  6 13:06:12 2021
Old-Return-Path: <vsementsov@virtuozzo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,MSGID_FROM_MTA_HEADER,
	MURPHY_DRUGS_REL8,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 4F458208EA
	for <lists-other-nbd@bendel.debian.org>; Mon,  6 Dec 2021 12:48:58 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=1.918 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	MSGID_FROM_MTA_HEADER=3, MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-0.001,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id dksMih6yznHo for <lists-other-nbd@bendel.debian.org>;
	Mon,  6 Dec 2021 12:48:53 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_NE_HELO=0.5 (check from: .virtuozzo. - helo: .eur05-am6-obe.outbound.protection.outlook. - helo-domain: .outlook.)  FROM_NOT_FAILED_HELO(DOMAIN)=1 REV_IP_EQ_HELO_DOMAIN=-1.25; rate: -1.25
X-Greylist: delayed 1564 seconds by postgrey-1.36 at bendel; Mon, 06 Dec 2021 12:48:53 UTC
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2103.outbound.protection.outlook.com [40.107.22.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 823A620248
	for <nbd@other.debian.org>; Mon,  6 Dec 2021 12:48:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I2VflhSd5Q2hjkcYMixgKxY47x/vqaIJdutyki0qP80wya99iKOYW9zKeVjThiMlPQivOmzSzyDir+V9mYmzsJyyvmB/vQrOUVp32tC4BnhxRrQc5cDHTgMWYpSW6VBgloPv+V4j+29TyrQvGH6W+nQKE+sbLidMmowVLNNy5verQU+vhn8DAQD3y9aHFu94Z2aP5QQNqo0hGp+SrM6D62TtOsh9avZX4K+ug1VW337k8VNIrvI7SIOPoxfQO+mj1q2PfUfmSeSRQcVJq3egEWhBHbTOWUYSSldHAEghlTUVhhRnYBhKS/savrAX22KfhrJdS7WN2LeQuEjjGJsqFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8+CbISjcD+gCPw7oYlHEyYiJQlOGbdWfVqkYvr8qUww=;
 b=XoZD9Mvd2kjz+MNpqH6MvAbXEYyTiuxIYrSaByZ23XLq/+jgIWL4TIHWVfAnx+ezL6tw9EYGC+M3Hx+Hb83fbKGm2F6AtKiK96xaOqu254j2+hYMoSNkvDbqvvUEZoOkaXO4yc8nDUbemYpqW/66NnhRuNkd5sHqSiTPOsql0GZmYR5mhA3v3jea8X6V04Xt4J2fqccrxSqYKnc/RpnyDs6NGHvbEUfzTaeJxvwoT5lgP4yyO9Zry7DbOw4HgOrquhVgIMNqThpsJa1lZ5KDBQp2osY0oVxdmeKxs/fTOV7hqv+j+6CmqB2tTsyvii88lVXLWwpgyvZ0iRl1gCqGqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8+CbISjcD+gCPw7oYlHEyYiJQlOGbdWfVqkYvr8qUww=;
 b=N2Wez5MkF5wWZRRHBQ0wSFdmiTZfa7T/HQjVlb9GHOdAcckvtVh5lM6d6cwCDoBVnHtMYRlD3YTZFg1m+756wzXOsvPe21GmohDg0X7TazdA32p+n+TgW5PAPhvMpOwFxNwk2yf1sw8Nrzsgal2P+fQxxS4y1K/kVRzihzoTkqA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM0PR08MB2993.eurprd08.prod.outlook.com (2603:10a6:208:5d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.16; Mon, 6 Dec
 2021 12:33:34 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.024; Mon, 6 Dec 2021
 12:33:34 +0000
Message-ID: <9401a194-1296-e0bb-092f-861ee7267b2d@virtuozzo.com>
Date: Mon, 6 Dec 2021 15:33:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 04/14] nbd/client: Add safety check on chunk payload
 length
Content-Language: en-US
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: nbd@other.debian.org, qemu-block@nongnu.org, libguestfs@redhat.com,
 nsoffer@redhat.com
References: <20211203231307.wmtbw7r72tyzkkax@redhat.com>
 <20211203231539.3900865-1-eblake@redhat.com>
 <20211203231539.3900865-5-eblake@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20211203231539.3900865-5-eblake@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR07CA0054.eurprd07.prod.outlook.com
 (2603:10a6:20b:459::32) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
Received: from [192.168.100.10] (185.215.60.230) by AS8PR07CA0054.eurprd07.prod.outlook.com (2603:10a6:20b:459::32) with Microsoft SMTP Server (version=TLS1_2, cipher=) via Frontend Transport; Mon, 6 Dec 2021 12:33:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5d12a0c6-7820-44cd-cf44-08d9b8b49e88
X-MS-TrafficTypeDiagnostic: AM0PR08MB2993:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB2993B278629B18B11CA91F1EC16D9@AM0PR08MB2993.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bwJXJNqVD7YXiImochtAAoC5d4VkbquNP7FIgHl7vZJ9SSPDEGyh9Z6tynRwiesA4rauCzdpsQfY0ECI6LMkC3Tp0O7CDXM2eFt3dGITqmUmEFXIQL6hy68wDhG3kxfDRoJbPsGG1MRSRt8cLmMIPRHq0QfS5hi7Og+ka+BKBoExbyBDQRREuZYs1r3L3FC+7lv+u5XNwxlyzS4+iOBsrDFumSaC5K58GbJXCFlyCHfGfCpYS8YZIh9JyW49ly9fmVArHI9TLEpuwp61i6EeGFWzfculFj6naRSueJ6eSYILgCAYw+GN/57gah/dMMPWIW6w3ZJnkG39zDqOymR/+VV2Njn7M6OJ+07FytSGJxnfnRk6jebgO6hX4KsfpYs45rKqFgyxXML1ZmR36CyIE8tPhIPOjMyJ83a5tepnQBL0Pxew1cFur2PQqRkpNA5Q9+GwKvSyddD47wP6HWhWqGrYHEPwV7V0nq7nXV1zB2zh5Z9qX+lI5K5MnbLE5U2hRd7i2MdINzz7xmnND/LbpyO8GBJO2eiOfPgVLM3bYmtc0/Q6pK7bm1aD0PzQ0aQUczUG2Me11/l7jVz//3AyAxqzQpY1Tto/NJq8CODje5qgGwTtJNBDWZIhiyACWk0xK8h1f/rR+/wkHViidN6jC/VCZNxJ0pR2BhOOokBoW5+297kxtS8qBv0noyVQD49AUWgnxAYfoBIVCRL/fk7rMoMe1qumP4C36agvYpe7TbbPty3Go87m6NjyoBMbU5+vwzWs02/eeRIr1R6mo3PkMg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6737.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38350700002)(2906002)(52116002)(26005)(83380400001)(38100700002)(86362001)(31686004)(5660300002)(4326008)(36756003)(186003)(16576012)(31696002)(316002)(508600001)(66476007)(66946007)(956004)(8936002)(2616005)(6486002)(8676002)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M0x0SEN3YkFEQ0NLdG5PVktBQk9sOFFSNU9hVTNZRFZBcHA4SlRzb05URm1T?=
 =?utf-8?B?eVN4TldvTnd2a1ByRmVwbHZDVHpHMk5xdndYZjhDWWlOVzhJdFgySmM3bTlG?=
 =?utf-8?B?c0JaWVJ2aGV3OGllOUJwc2ZSUDZFc3RvcWRqVFR0aVlvYjQxRHZPSkw3bVZM?=
 =?utf-8?B?R1FBYmVxeVZXVnB2WFdCZHBtS0x6MWF0cHk5YmhPVVlkNE9YZlVHd1V4aXBY?=
 =?utf-8?B?bXZLSUxIVXZhYmtiVkdKWEJiSnV4TTczYVA0WmlQWkIzeEZkNXMrUXpqRGFX?=
 =?utf-8?B?YjZCM3pCNEliSEZlZjhmNUNLZEh3cE5jQ2hFMXZOL0g4WjBRWVN3UTB4d01v?=
 =?utf-8?B?eFdkOEVtMCs5VStCaS9YVVF5a2hKR0JRL2hqSW1WUGgvZEwxbmVOaGdTNHIz?=
 =?utf-8?B?M05CekpSb0UrUUUwM2hmVE84MDIvenlkd1RabGN6YmVvREJpY05kMU00d2hR?=
 =?utf-8?B?NTQ4b2NsbVBYR01BS0E3ZG56aWpKM2tZRmVCRy91dUQ4V3U0dHNacU11UFlR?=
 =?utf-8?B?OUE3RmpncTdiQ05aem5JaHFmdGpudHhBM0l0b2NsRk8zOEJ2UE4rRHZxRm1P?=
 =?utf-8?B?MnpJdXY3Tld6N1l2WnFzK1VweU1ISkxBeHlaSExxSXdhZmRNNXMzaGRtMk9S?=
 =?utf-8?B?cDkyNFZsRENNYWRJZ1VpQkFtaGlQSXpZNGNtL240em1ua25oSW9CRnBZZU5J?=
 =?utf-8?B?UFA0dUhTRENKMkcyNGV4RG80cjNMSzdQRFJxUG52bEplOXR2V0R5TnZTUERH?=
 =?utf-8?B?TjBYT0tSQktwUzhWU0M3ck0zTlpLVjhReVVSRWNUaTFQVHl0bDBOays1b1Uv?=
 =?utf-8?B?OE81VklVL0JKOHpLbi9NNzMzRXNNUFlkRnZ0K29nQ3JsUzZIZldVZWJlU013?=
 =?utf-8?B?WEl6cUhqSy9PVVFKRUU4MWdvUENmb0Ivall0L1JzamVueHc0ZlZTMnFuZTJI?=
 =?utf-8?B?YzFGR3liWXFSQXZnN2RBU0JEZnIzcERoMEFMQ1c0b0lobUFKTS9nT2dvVWVz?=
 =?utf-8?B?eDNhMUNyUUM3NDFvY2dmOVJRN2R1RHlicW9vcjRnZFF5NEN0cS9TT3dpQ2Fx?=
 =?utf-8?B?bzc5aEVKRldMY3FDU21RTlBMaXJMUjZ6cTNjV1FxQ25pSzlWVVdtdDFpd3NY?=
 =?utf-8?B?cUo5U2xXSnpWUEFZQ0Z6M2FOWmxOWDk5V0toaml4aEVKYTVuVUhuOURFMWU3?=
 =?utf-8?B?a3Y1RFJMdWFBbkxmOWpocUVSd2xxTzA3M0NWZmdmWE9id2ZxS1o3b05FMWs5?=
 =?utf-8?B?UHYyZStiaGZtK0hCWVVOUXdXNG5LbisrWXU2VlNzRzRhYXp5VHdPZERHTjkw?=
 =?utf-8?B?c3NOM210dWdrckhtTEJTWENyQU93cVQzcHZ5b3Uyc0xLM1NGeVlhcjdEVUdo?=
 =?utf-8?B?VGgyeU9JVEg3eWNreWE0Q2lXZ01lZnAydUVLOFJ2cmhHU1pNOEFmMVI5eFJW?=
 =?utf-8?B?YnJ1L3p0ZGVlZG1OY3QwRkhoM0p3L2pnZUJRd0kxRUlobmhBQWNBbEdxb0FU?=
 =?utf-8?B?K3V1dUpKUGNFV1RNalZRLzFXZStJUjIzT2k5MnJNdlRjbS9XbTFJU1VMWVVa?=
 =?utf-8?B?QzdyMHpLU1FtWWwxRTNKQ1kzUmNlVjlRTmtqWWtqbnI2R3FwY3d5eXJUZUQv?=
 =?utf-8?B?YlZ3M1MyWHRnRjdTR3E5RkVMc3pmd1J1TUJvU2xnRlFCQ1pBVHpnOUFpem5i?=
 =?utf-8?B?VVZnMUNhNW0xbzB1QkhKYVpoYWdSbGcwY1o3emYrbFJLTFlCTnBGU0cvQitu?=
 =?utf-8?B?TEpXQ1Fhd1QxU3NLZ095TGdIelp5cjducFQwUHYwTWltMEdmZU9TS0tUL2FW?=
 =?utf-8?B?aXhudkNDK0U2Mm5CYnorL08zenZEL2lRcWdOYVA4T2xVOUhuMVZQYm9nVmpT?=
 =?utf-8?B?VWhRWWx0T2F0eTNFTDFHMXJDa2tYYmRVRytqM24wc3pKRVpOaFFodmcvUVFE?=
 =?utf-8?B?bHJGMitNZk9iOVpDUmxNdDJHQUZEV3gyaHFJMFdjQUpzRWZNTFFyNUUySzdx?=
 =?utf-8?B?dzZiZ3Y0SzFXWlprUXg4MUxnR2VKM2g3WnRjcEZvREcwN0ljRTc3VlNkZkpG?=
 =?utf-8?B?eHJrNEVWazFWTlBKbnRkcjNHcWF0Wm5Lb3grcUU2QUJYbGxWSGJIazJKYUt3?=
 =?utf-8?B?dkdLSVdLYkljaVgvaUM1UHZYZHlnMVQzNWFiQjV3Z1ZrajA1Nkd0cHJMd3RO?=
 =?utf-8?B?V1lMWDRsclA1Uzc5WHFGQVVvUVJnOVdEMXZ6K2NIS2ozR1IzMzh4Y29EV0hS?=
 =?utf-8?Q?5XfP9kt2Z0Qumix95mh0MEdTXcwQkBkibacqOAs/LA=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d12a0c6-7820-44cd-cf44-08d9b8b49e88
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 12:33:34.3971
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T/XyoGAFQrROLP51/S/SbI0Zwg+GBIk0+SbXplU/K7VYWIqYHFhVby2uw1utEO+njDfKoZ8YkwYVqyVlH/92FCRuUeDSAiK5PhXIgocB/Nc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB2993
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <NBlzv7spmmN.A.l7G.ErgrhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1648
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/9401a194-1296-e0bb-092f-861ee7267b2d@virtuozzo.com
Resent-Date: Mon,  6 Dec 2021 13:06:12 +0000 (UTC)

04.12.2021 02:15, Eric Blake wrote:
> Our existing use of structured replies either reads into a qiov capped
> at 32M (NBD_CMD_READ) or caps allocation to 1000 bytes (see
> NBD_MAX_MALLOC_PAYLOAD in block/nbd.c).  But the existing length
> checks are rather late; if we encounter a buggy (or malicious) server
> that sends a super-large payload length, we should drop the connection
> right then rather than assuming the layer on top will be careful.
> This becomes more important when we permit 64-bit lengths which are
> even more likely to have the potential for attempted denial of service
> abuse.
> 
> Signed-off-by: Eric Blake <eblake@redhat.com>


Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

> ---
>   nbd/client.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/nbd/client.c b/nbd/client.c
> index 30d5383cb195..8f137c2320bb 100644
> --- a/nbd/client.c
> +++ b/nbd/client.c
> @@ -1412,6 +1412,18 @@ static int nbd_receive_structured_reply_chunk(QIOChannel *ioc,
>       chunk->handle = be64_to_cpu(chunk->handle);
>       chunk->length = be32_to_cpu(chunk->length);
> 
> +    /*
> +     * Because we use BLOCK_STATUS with REQ_ONE, and cap READ requests
> +     * at 32M, no valid server should send us payload larger than
> +     * this.  Even if we stopped using REQ_ONE, sane servers will cap
> +     * the number of extents they return for block status.
> +     */
> +    if (chunk->length > NBD_MAX_BUFFER_SIZE + sizeof(NBDStructuredReadData)) {
> +        error_setg(errp, "server chunk %" PRIu32 " (%s) payload is too long",
> +                   chunk->type, nbd_rep_lookup(chunk->type));
> +        return -EINVAL;
> +    }
> +
>       return 0;
>   }
> 


-- 
Best regards,
Vladimir

