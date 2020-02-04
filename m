Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id B7AD8151BA7
	for <lists+nbd@lfdr.de>; Tue,  4 Feb 2020 14:51:16 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 9EA6820531; Tue,  4 Feb 2020 13:51:16 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Feb  4 13:51:16 2020
Old-Return-Path: <vsementsov@virtuozzo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: **
X-Spam-Status: No, score=2.7 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,MSGID_FROM_MTA_HEADER,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2 autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 2450F2057C
	for <lists-other-nbd@bendel.debian.org>; Tue,  4 Feb 2020 13:33:55 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.799 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, MSGID_FROM_MTA_HEADER=3,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 78a7Z4ClExQM for <lists-other-nbd@bendel.debian.org>;
	Tue,  4 Feb 2020 13:33:49 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_NE_HELO=0.5 (check from: .virtuozzo. - helo: .eur05-am6-obe.outbound.protection.outlook. - helo-domain: .outlook.)  FROM_NOT_FAILED_HELO(DOMAIN)=1 REV_IP_EQ_HELO_DOMAIN=-1.25; rate: -1.25
X-Greylist: delayed 1038 seconds by postgrey-1.36 at bendel; Tue, 04 Feb 2020 13:33:46 UTC
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2132.outbound.protection.outlook.com [40.107.22.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 0620420563
	for <nbd@other.debian.org>; Tue,  4 Feb 2020 13:33:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b35cP6ELQr+uhvtWJf9wMJyeol58FuWOoxlmYwPYFG240Ay8G+Lvf9WoFTOb2t2OTDAI6szysvV2qYYcyTQkP7Yi1JNEQ+Unis7wBoii1SuWXoc+N6vRf1Ikaiy9UqlX6WVrlsId8la4OY4E5H8QUIbm+7MChNZ619Gl5DaQVS1tawjVS3oFcoKBsUbNIjY09vDEhAp39XjijUVGh9gc1UlyKVlmHl0T6w87EBMfQ5CdNCrZ/4X8oeN33bQND0YqK0qG29vnwVxPT1emFAABrD8/bVhw+64WWrlwk5zEkPKod+LSvH5mZZMMqPSUX/c62p3CKdHKUSCLieVh/wB+EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KFB8AR/fcsn8R3rGZfjv35GgCZqJtwNaIVT+3+mYaYY=;
 b=M3V1zResfCFBTVK6XsJiUybPYA+lLW8QLu2InFx+4I67tDcqQTshYDlctjxf5fb80lU5vvd/dWOrlRsz6LsSGcIUrSI+9S4wbYyu2oV6da+hoGZsjSjnfgwTZ8W0Lpr3Dl8Y7KHG19f1r/PrtIqz9cmlXACIQ43EG6lUc0h05E/Wzq24V8uBG7LdlzpnOQ4lAAArr3tLB5MD2WC/309W7IEC2ldNSFhr8ZI+JgyWKRxIHrmDeG3S4WuV5tru4cHQc3SVfDDu4meIaf8IxCjzVYFZBqzGx0lAtlyZDUbNCLjLc84oW5PyBCDs1te1n5KUoSSnvfKBz64ApCXRo7FGAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KFB8AR/fcsn8R3rGZfjv35GgCZqJtwNaIVT+3+mYaYY=;
 b=oUt/5UNqrqny4/wdOYSDytJ2TGGnO0yLGLqUEWVKooNlUOB8aiqihdmB3dtQqUbkQRtcHr2liiUaumZel+Fvyz+QOOM/fym2MFN5QceFjYg0GpH2X+7vtsiAlfZOv371c/umPI3qBnd0CmcbW0PN1LCYCgny2P7yrj27VGps2eI=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=vsementsov@virtuozzo.com; 
Received: from AM6PR08MB4423.eurprd08.prod.outlook.com (20.179.7.140) by
 AM6PR08MB3045.eurprd08.prod.outlook.com (52.135.163.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2686.30; Tue, 4 Feb 2020 13:01:31 +0000
Received: from AM6PR08MB4423.eurprd08.prod.outlook.com
 ([fe80::11a9:a944:c946:3030]) by AM6PR08MB4423.eurprd08.prod.outlook.com
 ([fe80::11a9:a944:c946:3030%7]) with mapi id 15.20.2686.034; Tue, 4 Feb 2020
 13:01:31 +0000
To: nbd list <nbd@other.debian.org>
Cc: qemu block <qemu-block@nongnu.org>, Eric Blake <eblake@redhat.com>,
 Wouter Verhelst <w@uter.be>, Nir Soffer <nsoffer@redhat.com>,
 "Denis V. Lunev" <den@openvz.org>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: NBD extended (or structured?) request
Message-ID: <e5129916-6664-18b0-6e4e-d3089553b735@virtuozzo.com>
Date: Tue, 4 Feb 2020 16:01:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: HE1PR05CA0217.eurprd05.prod.outlook.com
 (2603:10a6:3:fa::17) To AM6PR08MB4423.eurprd08.prod.outlook.com
 (2603:10a6:20b:bf::12)
MIME-Version: 1.0
Received: from [172.16.24.200] (185.231.240.5) by HE1PR05CA0217.eurprd05.prod.outlook.com (2603:10a6:3:fa::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2686.27 via Frontend Transport; Tue, 4 Feb 2020 13:01:30 +0000
X-Originating-IP: [185.231.240.5]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b56f846e-3059-4bb1-f633-08d7a9725ada
X-MS-TrafficTypeDiagnostic: AM6PR08MB3045:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB30454FC60731EC16DCECD198C1030@AM6PR08MB3045.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 03030B9493
X-Forefront-Antispam-Report:
	SFV:NSPM;SFS:(10019020)(39850400004)(396003)(366004)(376002)(346002)(136003)(199004)(189003)(66556008)(36756003)(956004)(2616005)(66946007)(66476007)(26005)(186003)(6486002)(2906002)(16526019)(81166006)(81156014)(8676002)(8936002)(31696002)(52116002)(478600001)(4326008)(107886003)(86362001)(31686004)(5660300002)(54906003)(16576012)(316002)(6916009);DIR:OUT;SFP:1102;SCL:1;SRVR:AM6PR08MB3045;H:AM6PR08MB4423.eurprd08.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
Received-SPF: None (protection.outlook.com: virtuozzo.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	a3RADRp9b6DRz757obxNAfhFJo2P4lJwPOaydeOgaUU+NWxRDPhe+cTF13vDA/dd8Dat1fF5+B+pV5881849Z4EJPfMCAGiD+omi2HIUjvSrunInU+OGxZ4sU6lNVDE4YIR0P2oOaHnUWwcE+eDU3mg6b5d60YX9ELPwZEmbvYJBhqxyalSF2ETMfU8WLX53p8xjkP5UdXofI1MVZIfTVqaXsDQF39vZH6gZni2zPhfiZEaWiegNqMIp7SgGO97hq8//6XT3cvwFr9kzMHkwMx0IGlhLoZBm0DMaI+IcKxn7qX7BI5Z3Qvl+KaFtP0Nv40ErZVDMmV75KxCLzAVHdgG+ZtqD1YkknWFWt3JkhzwMqcuWMXrt1j/xlcfE4CIOKN+nxKHKBKsX0muc1tOak1rXkbQMUSoPrhokK9CbTSnbpHCs4wu1WzbR64o3W+fG
X-MS-Exchange-AntiSpam-MessageData:
	w3NP1jLBSD9ZKCSd2g+kcxQfBPVYBo1QH2C4KavWVWzSGEdX0pkgEPj0TQkFIlwtZmQ5ogxyA61tTrud1tYywgheBJvD7nSo3wW9zsv26jX3mu9OKaNkL7KCADHlQOvc/g4rUMoQrPnoLK0tBwhAmQ==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b56f846e-3059-4bb1-f633-08d7a9725ada
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2020 13:01:31.2929
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +k3snoWMtoA51gsxLqcQwMnio7zEaTZ1qoqa2kpyPB6EJuA88EBJazTp0QroWe/OiC9gR/ancpwhEiZzxgiIfNBxmQw8+/9bSZhPN4aspcA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3045
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <DBtiVUh3iiM.A.etG.UbXOeB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/792
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/e5129916-6664-18b0-6e4e-d3089553b735@virtuozzo.com
Resent-Date: Tue,  4 Feb 2020 13:51:16 +0000 (UTC)

Hi all!

There are some ideas, which needs extra arguments in NBD request:

1. Selecting metacontext for NBD_BLOCK_STATUS [Nir], possibly through new
command, instead of extending the original [Wouter]

2. 64bit block-status/write-zeroes [I know about Eric's work on all-zero check,
but I think, that 32bit is too restrictive for data-less commands anyway,
skipping and fast-zeroing larger chunks would be profitable in different
scenarios)


I imagine two possibilities:

1. Just new request magic, negotiated by server flag, with structure like

64bits magic
32bits command
64bits handle
32bits length of payload
* payload

2. Or we can go further, and just take existing structured reply, allowing
requests with same semantics. We even can reuse the magic (but of course need
new server negotiation flag)

Remember that structured reply chunk has structure:
32bits magic
16bits flags
16bits type
64bits handle
32bits length of payload
* payload

And then, on command may consist from several chunks, the last one must contain
flag NBD_REPLY_FLAG_DONE (hmm, we'll need to rename it to just
NBD_STRUCTURED_CHUNK_FLAG_DONE). I think, that server even may start to reply
(send some structured reply chunks) before collecting all request chunks :)

This will also make possible to implement structured write, which may be useful
in a scenario, when we read from one NBD and write to another, we can keep
structured read result and pass it directly to structured write.

===

Then, we can add extended commands, like NBD_CMD_WRITE_ZEROES_64, with 8-bytes
payload:
64bits offset
64bits length

We can add 32bits or 16bits flags here, or we can use flags field of the
structured chunk, to store some command flags.

We can use same flags/type for this NBD_CMD_WRITE_ZEROES_64 as for
NBD_CMD_WRITE_ZEROES, or use new type.

Also, it's a question, should it be considered as absolutely new command, or
maybe better to alter existing description of NBD_CMD_WRITE_ZEROES to support
64bit feature.


-- 
Best regards,
Vladimir

