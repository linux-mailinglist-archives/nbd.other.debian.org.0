Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id D11231785BE
	for <lists+nbd@lfdr.de>; Tue,  3 Mar 2020 23:39:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 8EAE6201F6; Tue,  3 Mar 2020 22:39:08 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Mar  3 22:39:08 2020
Old-Return-Path: <mchristi@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=4.0 tests=DIGITS_LETTERS,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id B1E14201E3
	for <lists-other-nbd@bendel.debian.org>; Tue,  3 Mar 2020 22:21:35 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.181 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 8_qwVXlRkm8c for <lists-other-nbd@bendel.debian.org>;
	Tue,  3 Mar 2020 22:21:31 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by bendel.debian.org (Postfix) with ESMTP id 8A14620102
	for <nbd@other.debian.org>; Tue,  3 Mar 2020 22:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1583274086;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LJfnygAePkShLyJwBDPcEmlPbD5QCqwPG5FV/ZAFQ94=;
	b=ZgwfCQOwIxjicMR6Noo46Yo3qe0X9UkUMkKY+RVRvtwyYhNlaOF34etaw53KVmjZ6uocz9
	r4fvkgH8cd8ipV9tCxcDmTpFUDTwgtff+unVIK2CwsExdwChi+IjAP7WBOQOIel4RQeB8t
	neDOlmVxSh0zxCs4flDJM/77VQ2JWeY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-194-RMKfwPReNmCqK0XRCYtHGw-1; Tue, 03 Mar 2020 17:21:24 -0500
X-MC-Unique: RMKfwPReNmCqK0XRCYtHGw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F3B3018C8C00;
	Tue,  3 Mar 2020 22:21:22 +0000 (UTC)
Received: from [10.10.123.90] (ovpn-123-90.rdu2.redhat.com [10.10.123.90])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3F6CC90774;
	Tue,  3 Mar 2020 22:21:21 +0000 (UTC)
Subject: Re: [PATCH 2/2] nbd: requeue command if the soecket is changed
To: Josef Bacik <josef@toxicpanda.com>, Hou Pu <houpu.main@gmail.com>,
 axboe@kernel.dk
References: <20200228064030.16780-1-houpu@bytedance.com>
 <20200228064030.16780-3-houpu@bytedance.com>
 <34249aaa-7f0e-d0f4-7c1a-28aee9bddaa0@toxicpanda.com>
 <5E5ED4FF.8020209@redhat.com>
Cc: linux-block@vger.kernel.org, nbd@other.debian.org,
 Hou Pu <houpu@bytedance.com>
From: Mike Christie <mchristi@redhat.com>
Message-ID: <5E5ED861.6020209@redhat.com>
Date: Tue, 3 Mar 2020 16:21:21 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <5E5ED4FF.8020209@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <-fe22TnZ5JB.A.vXC.MytXeB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/845
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/5E5ED861.6020209@redhat.com
Resent-Date: Tue,  3 Mar 2020 22:39:08 +0000 (UTC)

On 03/03/2020 04:06 PM, Mike Christie wrote:
> On 03/03/2020 03:13 PM, Josef Bacik wrote:
>> On 2/28/20 1:40 AM, Hou Pu wrote:
>>> In commit 2da22da5734 (nbd: fix zero cmd timeout handling v2),
>>> it is allowed to reset timer when it fires if tag_set.timeout
>>> is set to zero. If the server is shutdown and a new socket
>>> is reconfigured, the request should be requeued to be processed by
>>> new server instead of waiting for response from the old one.
>>>
>>> Signed-off-by: Hou Pu <houpu@bytedance.com>
>>
>> I'm confused by this, if we get here we've already timed out and
>> requeued once right?  Why do we need to requeue again?  Thanks,
>>
> 
> We may not have timed out already. If the tag_set.timeout=0, then the
> block timer will fire every 30 seconds. This could be the first time the
> timer has fired. If it has fired multiple times already then it still
> would not have been requeued because the num_connections=1 code just
> does a BLK_EH_RESET_TIMER when timeout=0 and does not have support for
> detecting reconnects.
> 
> In this second patch if timeout=0 and num_connections=1 we restart the
> command when the command timer fires and we detect a new connection
> (nsock->cookie has incremented).
> 
> I was saying in the last patch, maybe waiting for reconnect is wrong.
> Does a cmd timeout=0 mean to wait for a reconnect or in this patch
> should we do:
> 
> 1. if timeout=0, num_connections=1, and the cmd timer fires and the
> conneciton is marked dead then requeue the command.
> 2. we then rely on the dead_conn_timeout code to decide how long to wait
> for a reconnect.
> 

Oh yeah, I had thought Hou implemented timeout=0 to wait for a reconnect
to handle existing apps. However, I am not sure if they exist. When we
had timeout=0 support the first time then we did not have multi conn and
reconnect support yet.

The current timeout=0 and reconnect support does not work since that is
what Hou is implementing, so we can decide the behavior now.

