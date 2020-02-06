Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7B9154688
	for <lists+nbd@lfdr.de>; Thu,  6 Feb 2020 15:51:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id E0E552041D; Thu,  6 Feb 2020 14:51:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Feb  6 14:51:09 2020
Old-Return-Path: <vsementsov@virtuozzo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: ***
X-Spam-Status: No, score=3.2 required=4.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FOURLA,MSGID_FROM_MTA_HEADER,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id CF68320383
	for <lists-other-nbd@bendel.debian.org>; Thu,  6 Feb 2020 14:33:33 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=1.32 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_INVALID=0.1, DKIM_SIGNED=0.1, FOURLA=0.1,
	MSGID_FROM_MTA_HEADER=3, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id zQcNAfyNsCcn for <lists-other-nbd@bendel.debian.org>;
	Thu,  6 Feb 2020 14:33:29 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_NE_HELO=0.5 (check from: .virtuozzo. - helo: .eur04-vi1-obe.outbound.protection.outlook. - helo-domain: .outlook.)  FROM_NOT_FAILED_HELO(DOMAIN)=1 REV_IP_EQ_HELO_DOMAIN=-1.25; rate: -1.25
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80127.outbound.protection.outlook.com [40.107.8.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id A2B5D20382
	for <nbd@other.debian.org>; Thu,  6 Feb 2020 14:33:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SAeTFMIDfkGw7UpE9az7pfVmCSZ/d0Jpv+C7+BMaFEII3pHfZkn82b4Z6AW3ej5/7MGEP9DhGXqRWRILUQfUM1dFbSCsqPacikc9ebt5C8KYXtiNOgE+Om1YmVMrg3RdL6XK52e/a3teAM8EoEm5UoCiuY2RldC8wqmbKRDLho3V58V/DE6xWi79EQW8bpSe0cq18AE0ML8yGzd86HS9erAyXGy/LyraUj2xBrIq5gkJpkUDA41d2JAhTXahnXBOHz4xTo7C2dxesERarAuUsycFrR09+lKzmAbw0LgB3b2oCQC0cZb7muv4oNdaz3aANc5lCX9q5NsCVsrXi7lm4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LiTdotXvNy0AZqf9R5gnPuKzZPShUdeU46VX0eNGKlA=;
 b=GA4uyPkCe+nyuRbaK3BjHmCmTFi/tSVnDMl4tdL4O4QLpAC7LRaXUSPWn2BZdcRWZeDLBVZk8RKUX3qePQjJtjTTJtNInnSdMkaeDePGLIMv+YxsRZ5fo8x6u1D80fZ1qqsDRcHrWBZNTLLiPg4wFa71U1/DcYmxNeakHWWDf1C2k47eh+aBfLObyg37HeGVAlEbZkIwVAImjrwtRMouIgqCwxR5ZAIZIAbAKr/PgtDUpmF31zHYuRcJZSdUA8bVo1HocQPDU30Qkx7rouD/fF2Kv7EEXMciQSNeXYMbrLsZtWgqG/aIZ+4V6AR+5uFxh6SFWB7kppi6hRDHyThHRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LiTdotXvNy0AZqf9R5gnPuKzZPShUdeU46VX0eNGKlA=;
 b=Q94VklgEtQprFZiJ4FG6BRxR7EkeNwyEjleNakUPyyN/9IxAkJn3GFvXvbNqnvIF/E8A0vYDdWfKuo9kGWfTNREkq5Zc8VsS90xk6EZQBX2bHY98GttrrkgASdXLRwtrhiULgixi+VUYPTfui0pg5hVNTnqz4Q0vt6DmKCytMKM=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=vsementsov@virtuozzo.com; 
Received: from AM6PR08MB4423.eurprd08.prod.outlook.com (20.179.7.140) by
 AM6PR08MB3414.eurprd08.prod.outlook.com (20.177.114.74) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2686.30; Thu, 6 Feb 2020 14:17:44 +0000
Received: from AM6PR08MB4423.eurprd08.prod.outlook.com
 ([fe80::e05a:63af:818c:b664]) by AM6PR08MB4423.eurprd08.prod.outlook.com
 ([fe80::e05a:63af:818c:b664%4]) with mapi id 15.20.2707.023; Thu, 6 Feb 2020
 14:17:44 +0000
Subject: Re: [PATCH 1/2] nbd/proto: introduce structured request
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: Eric Blake <eblake@redhat.com>, nbd@other.debian.org
Cc: qemu-block@nongnu.org, w@uter.be, nsoffer@redhat.com, den@openvz.org
References: <20200205164352.16673-1-vsementsov@virtuozzo.com>
 <20200205164352.16673-2-vsementsov@virtuozzo.com>
 <5e72ec19-604e-5840-a164-4b7ab0222a3e@redhat.com>
 <792fea52-f3c1-4bc3-450a-ce30167310a7@virtuozzo.com>
X-Tagtoolbar-Keys: D20200206171741731
Message-ID: <e9ad3cf4-ee53-0ef3-07d0-895af8bf691f@virtuozzo.com>
Date: Thu, 6 Feb 2020 17:17:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
In-Reply-To: <792fea52-f3c1-4bc3-450a-ce30167310a7@virtuozzo.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: HE1PR0202CA0021.eurprd02.prod.outlook.com
 (2603:10a6:3:8c::31) To AM6PR08MB4423.eurprd08.prod.outlook.com
 (2603:10a6:20b:bf::12)
MIME-Version: 1.0
Received: from [172.16.24.200] (185.231.240.5) by HE1PR0202CA0021.eurprd02.prod.outlook.com (2603:10a6:3:8c::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2707.23 via Frontend Transport; Thu, 6 Feb 2020 14:17:43 +0000
X-Tagtoolbar-Keys: D20200206171741731
X-Originating-IP: [185.231.240.5]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1cd3d90d-afc3-4cfe-559b-08d7ab0f552f
X-MS-TrafficTypeDiagnostic: AM6PR08MB3414:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB34149DEB5E1CE04B1E31AD0AC11D0@AM6PR08MB3414.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 0305463112
X-Forefront-Antispam-Report:
	SFV:NSPM;SFS:(10019020)(346002)(376002)(366004)(39850400004)(396003)(136003)(199004)(189003)(31686004)(956004)(53546011)(31696002)(16526019)(186003)(86362001)(66476007)(66946007)(316002)(16576012)(52116002)(26005)(4326008)(107886003)(478600001)(2616005)(81156014)(8936002)(6486002)(36756003)(81166006)(8676002)(5660300002)(2906002)(66556008);DIR:OUT;SFP:1102;SCL:1;SRVR:AM6PR08MB3414;H:AM6PR08MB4423.eurprd08.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
Received-SPF: None (protection.outlook.com: virtuozzo.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Mq1t52WzHNL2gFTF1s7HGgtq5pwSP32jIipxLfuvi6hRPG/IHAFS7kbkVkMjHIhk9iIRzldmWkF8qJD6vw6hCVPiv8l6DUbSBQzdaeNkQCNWkxO9WIIyhrrLzkU/sYXYascpqYzgmDqvBk+blwAt6VKjQJySFF2kov7UhRZ0Nn0hX/Ixqf97qVUiWz5doZf8rJ+gMCZAxA3Rnzybkmpf1hBrsdUM90+PAMVoEWv7kEFsG2r/BDAJQQX/HHusRYWP/ZiopX7o6hGdUaSrwj1ZvYgC36QvetoDBWlS13mKYMj1KgDZ+KA1w6yfzghNrG+oAO9tl/YWTWzT8s8CInj+jl7Lzzf0K4vUAXS8g4vX9xRGHVcp/MV9RiLJBbBh0A8bHAwLOUax8NJDDDhBeLy0lvm4xk8yHK0jHaBNr2EdB4pzvL2XYDDDCEGdsoim4ihV
X-MS-Exchange-AntiSpam-MessageData:
	EO7dNVvA/0beXVVwsI9IQWe9giPTz6Jz4wMpCie9PK+UjC5hErG7br/mnIckxCDMMOABhMx/IcjMSuo7qWv0q7YXc48pZ9RM5jAxH1NOAf9rzUKwtU1jS7GpPOhqqYgYCT+Xn3vjNUxstPbrTZwPWg==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cd3d90d-afc3-4cfe-559b-08d7ab0f552f
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2020 14:17:43.9338
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VADs4et0o5oILpmOGqCvL/4ohAQ4qhY2/3BJtimbv8Ad/JZ+BSMLwqCIf0wUiMBjXPKyreOz3M/T853fZVsO0xa02Bhz3GSqUoJBOjZ6jhQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3414
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <LAF4olbSUqF.A.pNG.dfCPeB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/799
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/e9ad3cf4-ee53-0ef3-07d0-895af8bf691f@virtuozzo.com
Resent-Date: Thu,  6 Feb 2020 14:51:09 +0000 (UTC)

06.02.2020 17:10, Vladimir Sementsov-Ogievskiy wrote:
> 06.02.2020 16:05, Eric Blake wrote:
>> On 2/5/20 10:43 AM, Vladimir Sementsov-Ogievskiy wrote:
>>> Idea: reuse structured replies as requests too. For this:
>>>
>>> Rename structured reply "structure" to structured message. And,
>>> correspondingly structured reply chunk to structured message chunk.
>>>
>>> Keep name "structured reply" for structured messages sent by server,
>>> and name "structured request" a structured message sent by client.
>>>
>>> Share almost all semantics around structured messages for client and
>>> server except for chunk type (as reply types and request types are
>>> orthogonal things). Still, share none-type chunk for both server and
>>> client.
>>>
>>
>> Without looking at the doc patch itself, my initial worry is as follows:
>>
>> For structured replies, we needed the ability to allow a server to have split replies (sparse reads were the primary reason behind that decision - the client does not know a priori which portions of the image are sparse, and the server needs some way to represent both data and holes each as efficiently as possible over the wire for a single read request).  On the client side, this means that either the client has to track enough state to reassemble multiple server messages intermixed with one another, or the client can choose to serialize things so that the server only ever has at most one outstanding command.  On the server side, some servers may already be smart enough to handle interleaved client requests such that structured replies can indeed end up interleaved, while others may serialize how they react to incoming client messages and send all chunks of a given reply (in the few cases where sending more than one chunk even makes sense) before parsing the next client 
>> message.  Thus, while the protocol permits interleaving, it does not force either side to implement interleaving.
>>
>> But if we allow structured requests to be split across multiple packets, we either have to mandate that clients CANNOT split requests across multiple packets, or we are FORCING the server to track additional state to deal with clients that fragment and interleave requests, even if most clients don't do that.
> 
> I understand this and I don't wont to implement such logic in a qemu nbd server now. So, I suggest to allow/disallow splitting per structured chunk type. If we define only WRITE_ZEROES64 chunk type and state that it must be the only chunk in the structured requests, nobody should implement splitted request handling in server.
> 
>> While split replies make sense, I'm having a hard time seeing how split requests would ever be useful (a client does not need to try to do a write with holes in a single request; instead, write the data and write the holes via two separate write requests over smaller portions of the export).  So while we may want to reuse the magic number and on-the-wire format of a structured message, I'd strongly argue that structured requests must be documented in a way that makes it obvious that they will always occupy exactly one chunk (reserving multiple chunks and the need for the DONE flag only for replies).
>>
> 
> Hmm, don't you think still, that structured writes may be useful at some point? Now we always translate structured read reply to real allocated in RAM zeroes. But at some point we may instead propagate this concept to the generic block layer, and make support for it in qcow2. Or even with support only in NBD we may benefit if we are coping data from one NBD to andother: we should not unpack zeroes.
> 
> Still, I don't want to implement it now, and I feel that block-status driven copying does the same and already works.
> 
> I agree, that now it's better to restrict multiple chunks in requests, and I'll resend with this in mind. Still, I seems good to document it so we'll be able to add multiple chunks support in future with no extra pain..
> 
> 

Or may be better to not worry about compatibility with structured replies, and don't touch them. It makes spec changing simpler.

-- 
Best regards,
Vladimir

