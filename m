Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id B77DD15AEB5
	for <lists+nbd@lfdr.de>; Wed, 12 Feb 2020 18:30:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id A21F920270; Wed, 12 Feb 2020 17:30:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Feb 12 17:30:09 2020
Old-Return-Path: <vsementsov@virtuozzo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: ***
X-Spam-Status: No, score=3.2 required=4.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FOURLA,MSGID_FROM_MTA_HEADER,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id E731A20378
	for <lists-other-nbd@bendel.debian.org>; Wed, 12 Feb 2020 17:14:12 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=1.32 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_INVALID=0.1, DKIM_SIGNED=0.1, FOURLA=0.1,
	MSGID_FROM_MTA_HEADER=3, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id e84gXcoKsgip for <lists-other-nbd@bendel.debian.org>;
	Wed, 12 Feb 2020 17:14:08 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_NE_HELO=0.5 (check from: .virtuozzo. - helo: .eur04-vi1-obe.outbound.protection.outlook. - helo-domain: .outlook.)  FROM_NOT_FAILED_HELO(DOMAIN)=1 REV_IP_EQ_HELO_DOMAIN=-1.25; rate: -1.25
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80127.outbound.protection.outlook.com [40.107.8.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 9DC4120376
	for <nbd@other.debian.org>; Wed, 12 Feb 2020 17:14:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QsDlbe9ML3yIH/gLrbzhiIG8bBAAYsv3fa8niyJZeeulaNSzV6lzFEw0LNycJJUiVRWnfmnVM7zCH8xNCDLDwEnQ9sqY9WgPdZFOpkD4mrH2Kpo7IXfgmFuzR0e2vHEZxh/eX8kFTNLDnzkGN0U0mTEgdtT+OAatTi/07RuWvwv+zL28nXT5jRBaCM8wqHWD37+OXYK8zteyGeTXWi2EL9WWh2M3tsDXyDrgKjPFDzffv/F7w2Gl65dWizc20URCLAV56ij/uUKFhzO6NMkH3vzzUNm7QMkgM1C246ym4VGZPLnai8+WPbG0IIMxp3hVSTCnLc6X7mUuynIBP9BYrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6w9PG/qogqvf4Z76BUhycGAITR3IEBsojppCTAx9dI0=;
 b=kRBuhiMwOHBVY9yupaCFPLZ9kM0bC1S+xdA5RlZngomdbw95jz7tk3sa8fiZh1F+Ik33JJg00APgtPnvWiLlVUhL7iZE38kcxxfpYt7QteehtghqvuPNaMLLFhuAAV/nDIhn2X2og7cPlwpMr3rqu/XPUdMrJmW5cou9EnGfaECj5+beC/PDpSKP4dR2G1xSugj8iRPrbEw0SWnphQs2FsPOuk89LDM8fB+RJvC1r+EY7t6QfAiQ7QYL07nBIHJiVliWcxxiVPnKfxMLtW5neLkTvbyWvdgMFjCLYgBuPsQ3g4qW4o6tZ1xTh3tf+txrmmFQ21dYPLXnin6/w03niw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6w9PG/qogqvf4Z76BUhycGAITR3IEBsojppCTAx9dI0=;
 b=Xda72YNKNCt0Eh/uJAEFzTVUZlu0I6sicjYo3FxRC6kPOYEDQiaBifa5clkuTP2/ZQrs8oCk7BcIhUgNI+ZEAOpS/Uuia69lX72CsHDXhPLLF+SI9xNvi4C5pZSTbU4UmJQmG41S93Hu5spwd6CKtzZTYjwgaiSKq1SJKHRXXk8=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=vsementsov@virtuozzo.com; 
Received: from AM6PR08MB4423.eurprd08.prod.outlook.com (20.179.7.140) by
 AM6PR08MB4504.eurprd08.prod.outlook.com (20.179.7.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.22; Wed, 12 Feb 2020 13:39:42 +0000
Received: from AM6PR08MB4423.eurprd08.prod.outlook.com
 ([fe80::e05a:63af:818c:b664]) by AM6PR08MB4423.eurprd08.prod.outlook.com
 ([fe80::e05a:63af:818c:b664%4]) with mapi id 15.20.2707.030; Wed, 12 Feb 2020
 13:39:42 +0000
Subject: Re: [PATCH] doc/proto: drop max-block restriction for data-less
 commands
To: Eric Blake <eblake@redhat.com>, nbd@other.debian.org
Cc: den@openvz.org
References: <20200204120257.3685-1-vsementsov@virtuozzo.com>
 <7ad1f7eb-14da-6fb0-309c-465208474223@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
X-Tagtoolbar-Keys: D20200212163940343
Message-ID: <c6ac1c13-2826-caba-f5ec-6207eabaa560@virtuozzo.com>
Date: Wed, 12 Feb 2020 16:39:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
In-Reply-To: <7ad1f7eb-14da-6fb0-309c-465208474223@redhat.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: HE1PR05CA0204.eurprd05.prod.outlook.com
 (2603:10a6:3:f9::28) To AM6PR08MB4423.eurprd08.prod.outlook.com
 (2603:10a6:20b:bf::12)
MIME-Version: 1.0
Received: from [172.16.24.200] (185.231.240.5) by HE1PR05CA0204.eurprd05.prod.outlook.com (2603:10a6:3:f9::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2707.27 via Frontend Transport; Wed, 12 Feb 2020 13:39:41 +0000
X-Tagtoolbar-Keys: D20200212163940343
X-Originating-IP: [185.231.240.5]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 441bbc31-09f1-486e-e74c-08d7afc1038d
X-MS-TrafficTypeDiagnostic: AM6PR08MB4504:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB45049B7178641E66EE90AA59C11B0@AM6PR08MB4504.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 0311124FA9
X-Forefront-Antispam-Report:
	SFV:NSPM;SFS:(10019020)(366004)(396003)(39850400004)(376002)(346002)(136003)(189003)(199004)(478600001)(31696002)(86362001)(53546011)(2616005)(66476007)(66946007)(66556008)(31686004)(36756003)(956004)(2906002)(16526019)(186003)(26005)(52116002)(81166006)(81156014)(8936002)(8676002)(4326008)(16576012)(316002)(5660300002)(107886003)(6486002);DIR:OUT;SFP:1102;SCL:1;SRVR:AM6PR08MB4504;H:AM6PR08MB4423.eurprd08.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
Received-SPF: None (protection.outlook.com: virtuozzo.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rIsvCr+6utekngi8FI6QrJornVCrjKL9QVGzP7arBvdHSF/xXzd/MbYleomjRbxtCFmS1NyMCeFIgqsKZUOFi2fvLr7iiPXcrJzwnAwTGZzdPQdP6IAohzcsuuwkE5YjWWXGhDGFHfNdvyhE5LuTBxdpUH2wdqwYtCMMGplM4ZzFlDMAW2YB+raXYS7laxFYDEdC30T1zNFuKTtQgvhRbRrbwNOKX2Ds3Lqsf/dXy8Kj9P6ILxoUTSFXatbkZ1gcf0AdMvM/hZ/sgYyhUnmLAZX0y5PbYrcrnfk37OjMx0MGDKr+nFGKp5xuCOxrhFWZAw5eBXmrYJLXZYUV+GrDzVO2XPZO9txUcccTdvcPLC7u/DMzkXdPJiRMCPYewAD87i4uk2Pa8ZPNwtQHPNMsKnNlh/GLMZSDYiN/35dt/sqEpiHqIatANqeNKYP8nqHM
X-MS-Exchange-AntiSpam-MessageData:
	NjfcMi/oGKOzleSS3LcIau4J+1ul2jMslRZ6AFyNnBooXvYOEt+20voaCd0IxZGJJZVYXowA+taawX21nNXCmq77ZeCdcSeeTDE5TxvjssX4bNj0AGEuz+WUCa1RtUjGHtkJqfh4Ngoqoq5nKKGH0w==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 441bbc31-09f1-486e-e74c-08d7afc1038d
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2020 13:39:42.1353
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5ejkJ7fvgCwMMspo4qr3lKbExYYww7JEch4TQ7taf0ACnR6o9x8L6h+3dq6BoFzo4uEOHrervn/btzuBbJk60O0rZpUKSIMRWIzjx6GwKIA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4504
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <9qPKrza8VAE.A.TSD.hYDReB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/821
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/c6ac1c13-2826-caba-f5ec-6207eabaa560@virtuozzo.com
Resent-Date: Wed, 12 Feb 2020 17:30:09 +0000 (UTC)

11.02.2020 19:45, Eric Blake wrote:
> On 2/4/20 6:02 AM, Vladimir Sementsov-Ogievskiy wrote:
>> max-block restriction make sense for NBD_CMD_WRITE and NBD_CMD_READ to
>> avoid big data transfer and long io operations at server side.
>> NBD_CMD_WRITE_ZEROES still may be realized on server through direct
>> writing zeroes, which may lead to long operation and huge allocation
>> and should be restricted by max-block.
>> Same for NBD_CMD_CACHE: long operation / big allocation.
>>
>> Still, NBD_CMD_TRIM, NBD_CMD_BLOCK_STATUS and NBD_CMD_WRITE_ZEROES with
>> NBD_CMD_FLAG_FAST_ZERO set are over-restricted by it. So, for better
>> performance, drop these restrictions.
>>
>> Note, that Qemu nbd server already works accordingly to this patch: it
>> doesn't check the restriction for NBD_CMD_TRIM, NBD_CMD_BLOCK_STATUS
>> and NBD_CMD_WRITE_ZEROES.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>
>> RFC question: hmm, Qemu nbd doesn't check restriction for WRITE_ZEROES
>> at all, even without NBD_CMD_FLAG_FAST_ZERO flag.
> 
> That's actually a good question.  I looked today at relaxing qemu as a client to take advantage of this change as committed, and it's a bit easier to relax if we can guarantee that the server handles all WRITE_ZEROES rather than just the FAST_ZERO requests with unlimited size (qemu automatically fragments large zero requests at the block layer; but if I make qemu's client code conditional on whether a FAST_ZERO is being requested, then block/nbd.c has to do report a larger max zero in nbd_refresh_limits() and fragmenting itself on non-fast requests, instead of getting pre-fragmented requests from the block layer).

I have close to be sent series for this, which drops extra restrictions. For write_zero the following logic will be proposed:

I introduce additional bs->bl.max_pwrite_zeroes_no_fallback, and in bdrv_co_do_pwrite_zeroes at start I have:

+    if (!(flags & BDRV_REQ_NO_FALLBACK) &&
+        (bs->supported_zero_flags & BDRV_REQ_NO_FALLBACK) &&
+        bs->bl.max_pwrite_zeroes &&
+        bs->bl.max_pwrite_zeroes < bytes &&
+        (bs->bl.max_pwrite_zeroes < bs->bl.max_pwrite_zeroes_no_fallback ||
+         bs->bl.max_pwrite_zeroes_no_fallback == 0))
+    {
+        assert(drv->bdrv_co_pwrite_zeroes);
+        flags |= BDRV_REQ_NO_FALLBACK;
+        auto_no_fallback = true;
+    }
+

And on first failure with ENOTSUP inside the zeroing loop, we (if auto_no_fallback is true) drop the flag and fallback to normal write_zero, retrying failed operation.

I hope I'll send the series soon.


> 
> But, as you say, with fast zeroes, the server already has to be aware on what qualifies as fast (only newer servers support it), while with older servers, you don't get FAST_ZERO.  At the same time, older servers don't know about the newer relaxed requirement, so clients STILL have to be prepared for EINVAL failures when an older server rejects what it considers to be oversized requests, regardless of whether the newer server handles that larger size.  So a client that wants to be portable to multiple servers HAS to be prepared for oversized requests to fail, and to consider scaling back to max block size rather than completely assuming the operation is not going to work.
> 
>>
>> So, we probably could go further, and allow big WRITE_ZEROES without
>> this flag..
>>
>> Or may be change s/MUST NOT/SHOULD NOT/ for this case..
> 
> Or I could follow through with my idea of letting clients and servers handshake actual limits with additional NBD_INFO_* during NBD_OPT_GO (now that I just posted my NBD_INFO_INIT_STATE patches, I'm getting closer to that as my next project).  The benefit of an advertised size is that clients won't have to guess if an oversized request will fail with EINVAL on an older server.
> 


-- 
Best regards,
Vladimir

