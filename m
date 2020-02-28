Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 0997D173571
	for <lists+nbd@lfdr.de>; Fri, 28 Feb 2020 11:39:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 59C0520988; Fri, 28 Feb 2020 10:39:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Feb 28 10:39:09 2020
Old-Return-Path: <vsementsov@virtuozzo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: ***
X-Spam-Status: No, score=3.8 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,MSGID_FROM_MTA_HEADER,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 5C3F4206F2
	for <lists-other-nbd@bendel.debian.org>; Fri, 28 Feb 2020 10:22:55 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=1.92 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	MSGID_FROM_MTA_HEADER=3, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id S614F1_n95eE for <lists-other-nbd@bendel.debian.org>;
	Fri, 28 Feb 2020 10:22:51 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 HELO_IP_IN_CL16_SUBNET=-0.41 (check from: .virtuozzo. - helo: .eur04-vi1-obe.outbound.protection.outlook. - helo-domain: .outlook.)  FROM/MX_MATCHES_UNVR_HELO(DOMAIN)_OR_CL_NAME(DOMAIN)=-1.5 REV_IP_EQ_HELO_DOMAIN=-1.25; rate: -4.66
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on070a.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe0e::70a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 10E21206FF
	for <nbd@other.debian.org>; Fri, 28 Feb 2020 10:22:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ISGDezFqEUF4qO8YzcWNw0eehxhwYncgSsS20j50P/wko6VlzjflO1P7snoraKdZNjZfoUlCljkwyuA6Hq+Nr54jrdyGQeRI4lblsP4QMQNcpHxMDHcbcJ4wCECX6QK8Og17weVyrcfe0fk3obf5VzCPADhkzqCsmS7lUAeniUpNWbz/aLTzXpCQwoTtXdEiggcagZOJ1UpP9MBIFfiq2kYn3eHSdYU+Dso4Y2qk08Kt12YzIxmK4B8YwEq3QkUqy2qRrEolQ1WzBNmDhGiPvDEJYhtCC2CO2kIiDyyIYVMJiRVPy1EJ0F8TyRTL5nwhoS66ndWXcnPnXdmQsZ9vVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OUde5uV1NMVegKvd95Dnaa8QYUvTXxhk+OzDTvlhcK0=;
 b=OVp3vY+NPpE1eb9unfzNgen5DiD/KSZdEdUTSPQz6Rv7OzuoV5qPSMVzh0e4ctTaCvuaUl83oIla9+h4CbuwrHUELd0fzCkDEDqBVOxn0b3eNEn9fhCgn0q/sbzQGhUn8jVOAkuVORqcRy4JkxBcJMtp7rzTZrv+CLyDvWU5ab5U+i0cGvZFNxzvEF8VNsedurnrNQmp5BX0iS/xuDrgKCiWw0PnSe5Ihg/A1y0DoxdHRH5PohnyP+oQ/7rMUpeZ7r6QIgSAEbvvqLNElYwOy5BKFP0+uiGVRGQpqf2GqbVZ3sI95WIodMwZzwQ6gnQfleLMZBX1UEXjaZ6bmV2UgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OUde5uV1NMVegKvd95Dnaa8QYUvTXxhk+OzDTvlhcK0=;
 b=QdkjS8yInRI1RwmEgyyzgkVRLBfvqUTH5Ay4F/xaHMHliZ6ZDuT4yCSrQE452FttSS4rB1g5ttPqVOLA/7pBRHejlSWeYQe02DfNbdqSQDppRdjAgAl6TJpTx3LK5RQiM19JT0cdpdZiQuWVQH4cT6IaUU9tzjU3sEWuPvuwcr4=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=vsementsov@virtuozzo.com; 
Received: from AM6PR08MB4423.eurprd08.prod.outlook.com (20.179.7.140) by
 AM6PR08MB2997.eurprd08.prod.outlook.com (52.135.165.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2772.14; Fri, 28 Feb 2020 10:22:45 +0000
Received: from AM6PR08MB4423.eurprd08.prod.outlook.com
 ([fe80::e05a:63af:818c:b664]) by AM6PR08MB4423.eurprd08.prod.outlook.com
 ([fe80::e05a:63af:818c:b664%4]) with mapi id 15.20.2750.024; Fri, 28 Feb 2020
 10:22:45 +0000
Subject: Re: [RFC v2] nbd/proto: introduce extended request and 64bit commands
To: nbd@other.debian.org
Cc: qemu-block@nongnu.org, eblake@redhat.com, w@uter.be, nsoffer@redhat.com,
 den@openvz.org
References: <20200206151547.5812-1-vsementsov@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
X-Tagtoolbar-Keys: D20200228132243662
Message-ID: <2f56c11f-3380-9b83-6873-2ec8f4c3d07d@virtuozzo.com>
Date: Fri, 28 Feb 2020 13:22:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
In-Reply-To: <20200206151547.5812-1-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: HE1PR0701CA0062.eurprd07.prod.outlook.com
 (2603:10a6:3:9e::30) To AM6PR08MB4423.eurprd08.prod.outlook.com
 (2603:10a6:20b:bf::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.16.24.200] (185.231.240.5) by HE1PR0701CA0062.eurprd07.prod.outlook.com (2603:10a6:3:9e::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.5 via Frontend Transport; Fri, 28 Feb 2020 10:22:45 +0000
X-Tagtoolbar-Keys: D20200228132243662
X-Originating-IP: [185.231.240.5]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6c7ddb5d-102b-416a-ef90-08d7bc382709
X-MS-TrafficTypeDiagnostic: AM6PR08MB2997:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB29976284DA2F74C2E38D890BC1E80@AM6PR08MB2997.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 0327618309
X-Forefront-Antispam-Report:
	SFV:NSPM;SFS:(10019020)(136003)(376002)(396003)(366004)(39850400004)(346002)(189003)(199004)(52116002)(8676002)(86362001)(8936002)(81166006)(2906002)(81156014)(31696002)(31686004)(16526019)(4326008)(36756003)(186003)(107886003)(6916009)(956004)(6486002)(2616005)(5660300002)(66556008)(66946007)(478600001)(66476007)(26005)(16576012)(316002);DIR:OUT;SFP:1102;SCL:1;SRVR:AM6PR08MB2997;H:AM6PR08MB4423.eurprd08.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
Received-SPF: None (protection.outlook.com: virtuozzo.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rFnF10DAfELAsobEyoEy2bhHT+Q16kU8RCEDMibkM1ivFF3hQu5/rnPXma9osSrxu59CVBr7i5qvIsyqhPBCxFwayTmuJ/UHKW4UwNYl9WJ6H+iZIveFFmKjIszrwcxjIkNqh8gpnp1wx8f8hOLeI3LY1wR7ZmOnz8ujGcU4A7sx4hpiMdUDn8pNUvwAdJPmFqwBFnrLJPTerysNx9pgSdvCPXHLzdiFD3P6AHKi7QvU3mJkI7UmZhuCedkzdkb8nmxLQhuz8Rvhkub3HYNfC6Dyom516hYCmlWSEBeuNte4B0I9Ei9vZBR+BddeRU8mxu9017oE2PdS897AzrCCP8GyCcIuKrfknUmj4zTaep18bnhPA1jboPtg7FmP+3jvwY9UfLmArefbv+pH58a0b4ziC+e4KXaVREXOdXn2fxPOs/0Q+uJnTyg2JMMu06M0
X-MS-Exchange-AntiSpam-MessageData:
	FV157gRiVYA+6JQfr8OY2MMGQXISfZuAClLe9mvwElzkftw8trkiVOr7sbMjc6DsoXqFqoVduKu5yslTgcBC+UwZnFba3Xr/b0qNwSz321ob55N/0yHbGFsNkbbDmSlbmzV5AmL6YlyOmNjK3WL3YQ==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c7ddb5d-102b-416a-ef90-08d7bc382709
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2020 10:22:45.7156
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fAi/lpTrDNgpFMCt8zCu75W4fjn9Lm/vq5NTFYx7Qj4ETIFNq6gX3V1MmiI6rYwLBT8oLKJUlvG8Bk7kzFVU9Z0/I4ow3aqXAatsx/Piyzo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB2997
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <4uh4BRhEAVH.A.BnD.N3OWeB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/838
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/2f56c11f-3380-9b83-6873-2ec8f4c3d07d@virtuozzo.com
Resent-Date: Fri, 28 Feb 2020 10:39:09 +0000 (UTC)

ping

06.02.2020 18:15, Vladimir Sementsov-Ogievskiy wrote:
> Introduce a request type with payload. Use it to add 64bit support to
> data-less commands.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
> 
> v1 was "[PATCH 0/2] Structured requests and 64bit commands"
> 
> v2: - don't touch structured replies. Still, no reason to not use the
> same structure as in structured reply chunk
>      - instead of documenting separate 64bit commands, just define
>      support for extended request in original commands.
> 
>   doc/proto.md | 50 +++++++++++++++++++++++++++++++++++++++++++++++---
>   1 file changed, 47 insertions(+), 3 deletions(-)
> 
> diff --git a/doc/proto.md b/doc/proto.md
> index fc7baf6..58e932d 100644
> --- a/doc/proto.md
> +++ b/doc/proto.md
> @@ -279,10 +279,10 @@ a soft disconnect.
>   
>   ### Transmission
>   
> -There are three message types in the transmission phase: the request,
> -the simple reply, and the structured reply chunk.  The
> +There are four message types in the transmission phase: the request,
> +the extended request, the simple reply, and the structured reply chunk.  The
>   transmission phase consists of a series of transactions, where the
> -client submits requests and the server sends corresponding replies
> +client submits (extended) requests and the server sends corresponding replies
>   with either a single simple reply or a series of one or more
>   structured reply chunks per request.  The phase continues until
>   either side terminates transmission; this can be performed cleanly
> @@ -353,6 +353,25 @@ C: 64 bits, offset (unsigned)
>   C: 32 bits, length (unsigned)
>   C: (*length* bytes of data if the request is of type `NBD_CMD_WRITE`)
>   
> +#### Extended request message
> +
> +The extended request message, sent by the client, looks as follows:
> +
> +C: 32 bits, 0x23876289, magic (`NBD_EXTENDED_REQUEST_MAGIC`)
> +C: 16 bits, flags
> +C: 16 bits, type
> +C: 64 bits, handle
> +C: 32 bits, length of payload (unsigned)
> +C: *length* bytes of payload data (if *length* is nonzero)
> +
> +The client MUST NOT send extended requests, unless
> +NBD_FLAG_EXTENDED_REQUEST is negotiated by the server. If
> +NBD_OPT_STRUCTURED_REPLY is negotiated client MAY send extended
> +requests of types `NBD_CMD_WRITE_ZEROES`, `NBD_CMD_TRIM`,
> +`NBD_CMD_BLOCK_STATUS`.
> +If the server (with negotiated NBD_FLAG_EXTENDED_REQUEST) receive
> +extended request of unsupported type it MUST reply with `NBD_EINVAL`.
> +
>   #### Simple reply message
>   
>   The simple reply message MUST be sent by the server in response to all
> @@ -1082,6 +1101,8 @@ The field has the following format:
>     will be faster than a regular write). Clients MUST NOT set the
>     `NBD_CMD_FLAG_FAST_ZERO` request flag unless this transmission flag
>     is set.
> +- bit 12, `NBD_FLAG_EXTENDED_REQUEST`; allow clients to use
> +  extended requests.
>   
>   Clients SHOULD ignore unknown flags.
>   
> @@ -1825,6 +1846,11 @@ contents, the client MUST initiate a hard disconnect.
>   
>   #### Request types
>   
> +The following types are shared for request message and extended
> +request message. Still, client MUST NOT send extended request of
> +specific type unless support for extended request directly defined
> +in type description below.
> +
>   The following request types exist:
>   
>   * `NBD_CMD_READ` (0)
> @@ -1986,6 +2012,12 @@ The following request types exist:
>       A client MUST NOT send a trim request unless `NBD_FLAG_SEND_TRIM`
>       was set in the transmission flags field.
>   
> +    `NBD_CMD_TRIM` supports extended requests, with the following
> +    16-bytes payload:
> +
> +    64 bits: offset
> +    64 bits: length
> +
>   * `NBD_CMD_CACHE` (5)
>   
>       A cache request.  The client is informing the server that it plans
> @@ -2095,6 +2127,12 @@ The following request types exist:
>       including one or more sectors beyond the size of the device. It SHOULD
>       return `NBD_EPERM` if it receives a write zeroes request on a read-only export.
>   
> +    `NBD_CMD_WRITE_ZEROES` supports extended requests, with the following
> +    16-bytes payload:
> +
> +    64 bits: offset
> +    64 bits: length
> +
>   * `NBD_CMD_BLOCK_STATUS` (7)
>   
>       A block status query request. Length and offset define the range
> @@ -2154,6 +2192,12 @@ The following request types exist:
>       `NBD_EINVAL` if it receives a `NBD_CMD_BLOCK_STATUS` request including
>       one or more sectors beyond the size of the device.
>   
> +    `NBD_CMD_BLOCK_STATUS` supports extended requests, with the following
> +    16-bytes payload:
> +
> +    64 bits: offset
> +    64 bits: length
> +
>   * `NBD_CMD_RESIZE` (8)
>   
>       Defined by the experimental `RESIZE`
> 


-- 
Best regards,
Vladimir

