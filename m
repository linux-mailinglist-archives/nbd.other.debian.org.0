Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
Delivered-To: lists+nbd@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4VYdI3plVmoL4wAAu9opvQ
	(envelope-from <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>)
	for <lists+nbd@lfdr.de>; Tue, 14 Jul 2026 18:36:10 +0200
X-Original-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7FF756FA6
	for <lists+nbd@lfdr.de>; Tue, 14 Jul 2026 18:36:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ibm.com header.s=pp1 header.b=MePzHdpY;
	spf=none (mail.lfdr.de: domain of "bounce-nbd=lists+nbd=lfdr.de@other.debian.org" has no SPF policy when checking 2001:41b8:202:deb:216:36ff:fe40:4002) smtp.mailfrom="bounce-nbd=lists+nbd=lfdr.de@other.debian.org";
	dmarc=pass (policy=none) header.from=ibm.com
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 0F666209EC; Tue, 14 Jul 2026 16:36:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Jul 14 16:36:09 2026
Old-Return-Path: <borntraeger@linux.ibm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL
	autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 63F19209E7
	for <lists-other-nbd@bendel.debian.org>; Tue, 14 Jul 2026 16:20:01 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.798 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
	RCVD_IN_MSPIKE_WL=0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id o6-1FZ9Defvp for <lists-other-nbd@bendel.debian.org>;
	Tue, 14 Jul 2026 16:19:55 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.pphosted.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 5AD48209E9
	for <nbd@other.debian.org>; Tue, 14 Jul 2026 16:19:55 +0000 (UTC)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EGC0pr1805984;
	Tue, 14 Jul 2026 16:19:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=W3kixr
	ryk6U5dmNNF+YNNGFGvKWYVKeHWS2lbNbw4OQ=; b=MePzHdpYyqiNuy2N1NwXsf
	XHWplxe3c/hb8wxPZHT9kHop3RKbHLRWtgC3tO53jGNXfXCBqyDIxWJFt+ERWfrM
	uQSiFhUwE8/KFVPPtl/mbXaeaVuJZszLauwslKGKd/OxcpW2DwJSi+zE2CmA1T5f
	y/ub713CCwQ/mVFVlLS3lHzegdnx44qQyo9lrnbc5v1yAYP5yaAklTWgf+8LSaNn
	DbNdFxEc0kWH3sraYGhXBWX0oVSSA2gTGZVSL/6/BJ5bZxdpKnMSayFnGoZXmJme
	azKlf6xX8JAnwHyNn6DX9ZTLlqE0hs1gnYCoGE8/MIe9XUf0+EYO1e7IpWHO/D4g
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4fbepxf5ar-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jul 2026 16:19:48 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 66EGJcPY014895;
	Tue, 14 Jul 2026 16:19:48 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4fc2cgbe9w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jul 2026 16:19:47 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 66EGJkwc18350522
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 14 Jul 2026 16:19:46 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 11FFD2004D;
	Tue, 14 Jul 2026 16:19:46 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AADB820043;
	Tue, 14 Jul 2026 16:19:45 +0000 (GMT)
Received: from [9.111.15.51] (unknown [9.111.15.51])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 14 Jul 2026 16:19:45 +0000 (GMT)
Message-ID: <b15b5fcd-441d-40a8-9055-4d232f3780bb@linux.ibm.com>
Date: Tue, 14 Jul 2026 18:19:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nbd: reclassify u->iolock of AF_UNIX sockets
To: Josef Bacik <josef@toxicpanda.com>, Eric Dumazet <edumazet@google.com>
Cc: Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>,
        linux-block@vger.kernel.org, nbd@other.debian.org,
        linux-kernel@vger.kernel.org
References: <20260713181401.11088-1-borntraeger@linux.ibm.com>
Content-Language: en-US
From: Christian Borntraeger <borntraeger@linux.ibm.com>
In-Reply-To: <20260713181401.11088-1-borntraeger@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: Bdm01HZG2189W2hotyunaxbeHSWL-AQm
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDE2OCBTYWx0ZWRfX/7qQUXQpvWQ/
 tA8WcxWAQVN7zXRK+J7Z7wAM9SqEWk/cYyYSC0exW/QD0cnMGSpY+5IpNrRpCo+23Vcgn0YhJXb
 qiWGcEbjFVbBfGdwM8Lvlm1Wn/OPO+4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDE2OCBTYWx0ZWRfXy97AZxq0qlEp
 9zMuwyJo7J/IeHjCc8m+XgaXu2rke3Bnnk9tQSAb+/ctsraV34DM18t1EXyOpPZ8L+qzSKAKSE4
 6iSJtx4iFdDCmW5FKOMPBfTHFj3rCxyBrTV+CYj8DOd+cjXW32ObGgsys8Bd/c/JBc/oS5urJGX
 FxLa1h009VDiiDeeyvnVShaUuHSPKFF+AwmlI7CAySAM1cpv2lHMFHXyjcRPmfmM3/M57Galz5V
 21BLC8+PVbqjiMW9hrF9CGZV72rc1IYGF3h6hEviYX49C1MH1FY3LDjM0xpP0oPXmT8aaP6MCmM
 FyUl2Ak0GG0nDZSwvOiqu2/cgGO7xCGlslpka+adf2ZuKPlj4dOUwvyR5G3nPXTCj8naxCuFyd3
 +DJmJydoiojXrAJglHAJNEfVyNI5XbxmihELjXm+Goto67kMwOfAudVZ9l1TZIMbyTfiNaTUTgU
 md+SA3v6wT0nKJ4WvEw==
X-Authority-Analysis: v=2.4 cv=XbS5Co55 c=1 sm=1 tr=0 ts=6a5661a5 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=iQ6ETzBq9ecOQQE5vZCe:22 a=VwQbUJbxAAAA:8
 a=sZWLkp-kluRfRaLivIQA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: o6GXcxiznXeGfwKjRNkQDO3HMRNZOAVi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_04,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140168
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <BuY5M9lbKs.A.jCQ.5VmVqB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3593
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/b15b5fcd-441d-40a8-9055-4d232f3780bb@linux.ibm.com
Resent-Date: Tue, 14 Jul 2026 16:36:10 +0000 (UTC)
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.01 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	R_SPF_NA(0.00)[no SPF record];
	TAGGED_FROM(0.00)[nbd=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:josef@toxicpanda.com,m:edumazet@google.com,m:axboe@kernel.dk,m:brauner@kernel.org,m:linux-block@vger.kernel.org,m:nbd@other.debian.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[borntraeger@linux.ibm.com,bounce-nbd=lists@other.debian.org];
	FORWARDED(0.00)[lists-other-nbd@bendel.debian.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ibm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:8365, ipnet:2001:41b8::/29, country:DE];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	FROM_NEQ_ENVFROM(0.00)[borntraeger@linux.ibm.com,bounce-nbd=lists@other.debian.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[nbd];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bendel.debian.org:helo,bendel.debian.org:rdns,linux.ibm.com:from_mime,linux.ibm.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2D7FF756FA6

Am 13.07.26 um 20:14 schrieb Christian Borntraeger:

I just realized I had my kernel.org address in from.
question is, is this the right fix and shall I do a proper patch wit correct from and signoff.

[..]

> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
> index 8f10762e90ef..a811e431b47a 100644
> --- a/drivers/block/nbd.c
> +++ b/drivers/block/nbd.c
> @@ -32,6 +32,7 @@
>   #include <linux/err.h>
>   #include <linux/kernel.h>
>   #include <linux/slab.h>
> +#include <net/af_unix.h>
>   #include <net/sock.h>
>   #include <linux/net.h>
>   #include <linux/kthread.h>
> @@ -1241,6 +1242,7 @@ static struct socket *nbd_get_socket(struct nbd_device *nbd, unsigned long fd,
>   #ifdef CONFIG_DEBUG_LOCK_ALLOC
>   static struct lock_class_key nbd_key[3];
>   static struct lock_class_key nbd_slock_key[3];
> +static struct lock_class_key nbd_unix_iolock_key;
>   
>   static void nbd_reclassify_socket(struct socket *sock)
>   {
> @@ -1267,6 +1269,17 @@ static void nbd_reclassify_socket(struct socket *sock)
>   					      &nbd_slock_key[2],
>   					      "sk_lock-AF_UNIX-NBD",
>   					      &nbd_key[2]);
> +		/*
> +		 * The AF_UNIX stream recvmsg/sendmsg paths serialize on
> +		 * u->iolock, not sk_lock, so it must be reclassified as
> +		 * well.  A held mutex cannot be reclassified; skip it in
> +		 * that case, as sock_allow_reclassification() does for
> +		 * sk_lock.
> +		 */
> +		if (!mutex_is_locked(&unix_sk(sk)->iolock))
> +			lockdep_set_class_and_name(&unix_sk(sk)->iolock,
> +						   &nbd_unix_iolock_key,
> +						   "&u->iolock-NBD");
>   		break;
>   	}
>   }

