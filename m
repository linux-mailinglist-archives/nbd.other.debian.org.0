Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ADCA178539
	for <lists+nbd@lfdr.de>; Tue,  3 Mar 2020 23:06:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 1F078201E5; Tue,  3 Mar 2020 22:06:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Mar  3 22:06:09 2020
Old-Return-Path: <mchristi@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=4.0 tests=DIGITS_LETTERS,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MD5_SHA1_SUM,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 87F25201B1
	for <lists-other-nbd@bendel.debian.org>; Tue,  3 Mar 2020 21:49:02 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.181 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, MD5_SHA1_SUM=-1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id DoaD1Wp4LrXS for <lists-other-nbd@bendel.debian.org>;
	Tue,  3 Mar 2020 21:48:58 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.7
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by bendel.debian.org (Postfix) with ESMTP id 51553201BF
	for <nbd@other.debian.org>; Tue,  3 Mar 2020 21:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1583272132;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mJ5IJZxUXYJY2aPXcozMT1iXwsLhHQPCUda0tz0Kbwc=;
	b=aI3TZpHoOPVTPTIFYqFihO7BCBw2IWeG+lGT87y1M5+nkyZ0R1W0ducizs8KjOpGorKQI5
	Qp0j+GMEVTJQN5PLeC6CkqsijrFVdGH5uI+04qbra2wwsIiIdNVeFmxQEz+pGnKWJixx0J
	io7WUNMQPnzG0wCveIXEQyIx0YOaDng=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-465-vq0HrggBPvGdSR5XfVhlYw-1; Tue, 03 Mar 2020 16:48:51 -0500
X-MC-Unique: vq0HrggBPvGdSR5XfVhlYw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 82FCC801E72;
	Tue,  3 Mar 2020 21:48:49 +0000 (UTC)
Received: from [10.10.123.90] (ovpn-123-90.rdu2.redhat.com [10.10.123.90])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 85DAB8C09A;
	Tue,  3 Mar 2020 21:48:48 +0000 (UTC)
Subject: Re: [PATCH 1/2] nbd: enable replace socket if only one connection is
 configured
To: Josef Bacik <josef@toxicpanda.com>, Hou Pu <houpu.main@gmail.com>,
 axboe@kernel.dk
References: <20200228064030.16780-1-houpu@bytedance.com>
 <20200228064030.16780-2-houpu@bytedance.com>
 <3b6ae210-f942-b74d-1e53-768c7e8c3675@toxicpanda.com>
Cc: linux-block@vger.kernel.org, nbd@other.debian.org,
 Hou Pu <houpu@bytedance.com>
From: Mike Christie <mchristi@redhat.com>
Message-ID: <5E5ED0BF.7030407@redhat.com>
Date: Tue, 3 Mar 2020 15:48:47 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <3b6ae210-f942-b74d-1e53-768c7e8c3675@toxicpanda.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <OTuE2VT_1JO.A.0wF.RTtXeB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/843
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/5E5ED0BF.7030407@redhat.com
Resent-Date: Tue,  3 Mar 2020 22:06:09 +0000 (UTC)

On 03/03/2020 03:12 PM, Josef Bacik wrote:
> On 2/28/20 1:40 AM, Hou Pu wrote:
>> Nbd server with multiple connections could be upgraded since
>> 560bc4b (nbd: handle dead connections). But if only one conncection
>> is configured, after we take down nbd server, all inflight IO
>> would finally timeout and return error. We could requeue them
>> like what we do with multiple connections and wait for new socket
>> in submit path.
>>
>> Signed-off-by: Hou Pu <houpu@bytedance.com>
>> ---
>>   drivers/block/nbd.c | 17 +++++++++--------
>>   1 file changed, 9 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
>> index 78181908f0df..83070714888b 100644
>> --- a/drivers/block/nbd.c
>> +++ b/drivers/block/nbd.c
>> @@ -395,16 +395,19 @@ static enum blk_eh_timer_return
>> nbd_xmit_timeout(struct request *req,
>>       }
>>       config = nbd->config;
>>   -    if (config->num_connections > 1) {
>> +    if (config->num_connections > 1 ||
>> +        (config->num_connections == 1 && nbd->tag_set.timeout)) {
> 
> This is every connection, do you mean to couple this with
> dead_conn_timeout? Thanks,
> 

In

commit 2da22da573481cc4837e246d0eee4d518b3f715e
Author: Mike Christie <mchristi@redhat.com>
Date:   Tue Aug 13 11:39:52 2019 -0500

    nbd: fix zero cmd timeout handling v2

we can set tag_set.timeout=0 again.

So if timeout != 0 and num_connections = 1, we requeue here and let
nbd_handle_cmd->wait_for_reconnect decide to wait or fail the command if
dead_conn_timeout is not set.

If timeout = 0, then we give it more time because it might have just
been a slow server or connection. I think this behavior is wrong for the
case Hou is fixing. See comment in the next patch.

