Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id DFED7727F90
	for <lists+nbd@lfdr.de>; Thu,  8 Jun 2023 14:00:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 4B00F204C2; Thu,  8 Jun 2023 12:00:13 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Jun  8 12:00:13 2023
Old-Return-Path: <lersek@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_NONE,T_SCC_BODY_TEXT_LINE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 3C7A020485
	for <lists-other-nbd@bendel.debian.org>; Thu,  8 Jun 2023 11:44:00 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.091 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id YZFNYq1A_5ro for <lists-other-nbd@bendel.debian.org>;
	Thu,  8 Jun 2023 11:43:52 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id 84564204AF
	for <nbd@other.debian.org>; Thu,  8 Jun 2023 11:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686224627;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xk+PtHB2L4uYIOoldZhflbn+B1ozNnOuhPpG3Bh2L+g=;
	b=W9or2Jx+Yjhd+fUpaZkUaZPMa9TnhxkHMgDjFFjCzEjgyXkL+KsGcPORrbwNTyLJDcSbXH
	Q+653XYS1zxmdwzo5I5qrbARB4gEiPMzsIjQ4ANDMryXnUW1P5tUyly/if5P6qshcbB5r0
	vdAAQBZnneM/lfSX+SO3QHwQIEgwLnA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-204-RyuWWFfzMvCXnaZhs7VyiQ-1; Thu, 08 Jun 2023 07:43:46 -0400
X-MC-Unique: RyuWWFfzMvCXnaZhs7VyiQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DA69D803DBD;
	Thu,  8 Jun 2023 11:43:45 +0000 (UTC)
Received: from [10.39.193.64] (unknown [10.39.193.64])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F278A492B00;
	Thu,  8 Jun 2023 11:43:44 +0000 (UTC)
Message-ID: <15599ebc-e58b-7f71-faf0-1f322b371ae0@redhat.com>
Date: Thu, 8 Jun 2023 13:43:43 +0200
MIME-Version: 1.0
Subject: Re: [Libguestfs] [libnbd PATCH v3 05/22] states: Prepare to receive
 64-bit replies
To: "Richard W.M. Jones" <rjones@redhat.com>
Cc: Eric Blake <eblake@redhat.com>, libguestfs@redhat.com,
 qemu-block@nongnu.org, nbd@other.debian.org
References: <20230525130108.757242-1-eblake@redhat.com>
 <20230525130108.757242-6-eblake@redhat.com>
 <80c36755-eda3-5d04-1418-89f11f825577@redhat.com>
 <20230607145500.GG7773@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
In-Reply-To: <20230607145500.GG7773@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <fGTQaHDV3AK.A.hMF.NLcgkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2543
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/15599ebc-e58b-7f71-faf0-1f322b371ae0@redhat.com
Resent-Date: Thu,  8 Jun 2023 12:00:13 +0000 (UTC)

On 6/7/23 16:55, Richard W.M. Jones wrote:
> On Thu, Jun 01, 2023 at 11:04:05AM +0200, Laszlo Ersek wrote:
>> On 5/25/23 15:00, Eric Blake wrote:
>>> @@ -69,11 +75,18 @@  REPLY.STRUCTURED_REPLY.RECV_REMAINING:
>>>   REPLY.STRUCTURED_REPLY.CHECK:
>>>    struct command *cmd = h->reply_cmd;
>>>    uint16_t flags, type;
>>> -  uint32_t length;
>>> +  uint64_t length;
>>> +  uint64_t offset = -1;
>>
>> (6) I disagree with initializing the local variable "offset" here.
>>
>> Below (in the rest of REPLY.STRUCTURED_REPLY.CHECK), we only read
>> "offset" back if "extended_headers" is set. But if "extended_headers" is
>> set, we also store a value to "offset", before the read.
>>
>> Initializing "offset" to -1 suggests that the code might otherwise read
>> an indeterminate value from "offset" -- but that's not the case.
> 
> You may find that the compiler will give a warning.  It's usually not
> good about dealing with the case where a variable being initialized +
> used depends on another variable being true.

Good point; that reminds me we used to encounter that issue specifically
in IA32 edk2 builds, but only when using old gcc (RHEL-7 era, gcc-4.8.5).

Of course it might still happen today. If that's the case, can we
comment the code that we initialize "offset" for shutting up the compiler?

Thanks!
Laszlo

