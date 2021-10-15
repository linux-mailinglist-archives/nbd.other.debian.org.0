Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4D342F80C
	for <lists+nbd@lfdr.de>; Fri, 15 Oct 2021 18:24:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 1F6782048D; Fri, 15 Oct 2021 16:24:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Oct 15 16:24:09 2021
Old-Return-Path: <josef@toxicpanda.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,FVGT_m_MULTI_ODD,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 2429A20412
	for <lists-other-nbd@bendel.debian.org>; Fri, 15 Oct 2021 16:08:40 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.96 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, FVGT_m_MULTI_ODD=0.02, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id ofY5vUYX7L10 for <lists-other-nbd@bendel.debian.org>;
	Fri, 15 Oct 2021 16:08:37 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .toxicpanda. - helo: .mail-qv1-xf29.google. - helo-domain: .google.)  FROM/MX_MATCHES_NOT_HELO(DOMAIN)=0; rate: -3.5
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com [IPv6:2607:f8b0:4864:20::f29])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 946332047F
	for <nbd@other.debian.org>; Fri, 15 Oct 2021 16:08:37 +0000 (UTC)
Received: by mail-qv1-xf29.google.com with SMTP id v10so6009757qvb.10
        for <nbd@other.debian.org>; Fri, 15 Oct 2021 09:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda-com.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=GAdQFrAQZCehdH1e2kq48dvufJAnUqGBfZzJlv3CVek=;
        b=GP9ebmzC++RxkBJA1tgf6fl3zHixx8sXUIdhiuTWKf+1h1IqjeLYjqcCXFgdSLxHN5
         qeGMokeltZ5OFlVNuMTUFnJgphwqEgNNhyqBwMs1aWA4rdS1lRKlSt0ayS6v1U+b6lUV
         8xKEFWpfeiX3vyFjFqFI8uRYAsZ3ThhGI8OA4Qhwl6tsXjn4pF3IIvEoIhQNiNrtGJNR
         SxXkVwiwTo9peC8qHDnQYpYRdBi4O9TT+YJBwaRQ4ECBjGonnGDR96wltNeJYK9VeX4C
         N+W0ZjEbAGrPg0V/3Z18PLiiInXE9wvRzcMNUvJmi+d11SJ9eo2EFkmxLXtvkasyCcra
         ga7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=GAdQFrAQZCehdH1e2kq48dvufJAnUqGBfZzJlv3CVek=;
        b=WjqmKawDduAwdv+y8VFUOb+98JdxRfx3gX+4hMiHnd0PwNyXN1sCnbwOqvYI7oEM5q
         tpocOR86LBdOUolImQE0dhvBKVy/hDhITIzLy1OpIfj/D0pEW/Q6VwPtODSQxx08Vc3b
         lUWle4QozdgbtznC9sobN4G+1dno6D4Xgddn9uXlLYXnl9+P60SwiScJcMml0rpRWyDH
         cItaiPJR0N6OfWCxg0hTkfRmftlWw/seqGQNLIrxhVavU3aUdOJS762YCC7qHlag3yq+
         1kPFxrv52x/EZNQ1++Cjo6CuhI2QmotWeSSa3d91nM6fNQO1x0vnwjvYLxKNEtF+FIby
         iW7Q==
X-Gm-Message-State: AOAM532jUnaICT/hXQ+PmsGh5MbmEpy5ESdb7tEWAlJ7IETX5kFbaCB7
	HpKx/yAkkna6V1qPTD47T7SzhA==
X-Google-Smtp-Source: ABdhPJz+3YfnV4LNGhTTV9nx5gmdn7QGabe/ydxIfs3HIqfUefe9yrbpYgBC0LUC/sCCpRB2UAd9pw==
X-Received: by 2002:a0c:e1d0:: with SMTP id v16mr11989800qvl.32.1634314113678;
        Fri, 15 Oct 2021 09:08:33 -0700 (PDT)
Received: from localhost (cpe-174-109-172-136.nc.res.rr.com. [174.109.172.136])
        by smtp.gmail.com with ESMTPSA id c26sm2829953qtm.21.2021.10.15.09.08.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 09:08:32 -0700 (PDT)
Date: Fri, 15 Oct 2021 12:08:31 -0400
From: Josef Bacik <josef@toxicpanda.com>
To: Yu Kuai <yukuai3@huawei.com>
Cc: axboe@kernel.dk, ming.lei@redhat.com, hch@infradead.org,
	linux-block@vger.kernel.org, nbd@other.debian.org,
	linux-kernel@vger.kernel.org, yi.zhang@huawei.com
Subject: Re: [patch v8 0/7] handle unexpected message from server
Message-ID: <YWmnf58kSPykulbR@localhost.localdomain>
References: <20210916093350.1410403-1-yukuai3@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210916093350.1410403-1-yukuai3@huawei.com>
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <dW4Mod_wgRB.A.-EH.psaahB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1540
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/YWmnf58kSPykulbR@localhost.localdomain
Resent-Date: Fri, 15 Oct 2021 16:24:09 +0000 (UTC)

On Thu, Sep 16, 2021 at 05:33:43PM +0800, Yu Kuai wrote:
> This patch set tries to fix that client might oops if nbd server send
> unexpected message to client, for example, our syzkaller report a uaf
> in nbd_read_stat():
> 
> Call trace:
>  dump_backtrace+0x0/0x310 arch/arm64/kernel/time.c:78
>  show_stack+0x28/0x38 arch/arm64/kernel/traps.c:158
>  __dump_stack lib/dump_stack.c:77 [inline]
>  dump_stack+0x144/0x1b4 lib/dump_stack.c:118
>  print_address_description+0x68/0x2d0 mm/kasan/report.c:253
>  kasan_report_error mm/kasan/report.c:351 [inline]
>  kasan_report+0x134/0x2f0 mm/kasan/report.c:409
>  check_memory_region_inline mm/kasan/kasan.c:260 [inline]
>  __asan_load4+0x88/0xb0 mm/kasan/kasan.c:699
>  __read_once_size include/linux/compiler.h:193 [inline]
>  blk_mq_rq_state block/blk-mq.h:106 [inline]
>  blk_mq_request_started+0x24/0x40 block/blk-mq.c:644
>  nbd_read_stat drivers/block/nbd.c:670 [inline]
>  recv_work+0x1bc/0x890 drivers/block/nbd.c:749
>  process_one_work+0x3ec/0x9e0 kernel/workqueue.c:2147
>  worker_thread+0x80/0x9d0 kernel/workqueue.c:2302
>  kthread+0x1d8/0x1e0 kernel/kthread.c:255
>  ret_from_fork+0x10/0x18 arch/arm64/kernel/entry.S:1174
> 
> 1) At first, a normal io is submitted and completed with scheduler:
> 
> internel_tag = blk_mq_get_tag -> get tag from sched_tags
>  blk_mq_rq_ctx_init
>   sched_tags->rq[internel_tag] = sched_tag->static_rq[internel_tag]
> ...
> blk_mq_get_driver_tag
>  __blk_mq_get_driver_tag -> get tag from tags
>  tags->rq[tag] = sched_tag->static_rq[internel_tag]
> 
> So, both tags->rq[tag] and sched_tags->rq[internel_tag] are pointing
> to the request: sched_tags->static_rq[internal_tag]. Even if the
> io is finished.
> 
> 2) nbd server send a reply with random tag directly:
> 
> recv_work
>  nbd_read_stat
>   blk_mq_tag_to_rq(tags, tag)
>    rq = tags->rq[tag]
> 
> 3) if the sched_tags->static_rq is freed:
> 
> blk_mq_sched_free_requests
>  blk_mq_free_rqs(q->tag_set, hctx->sched_tags, i)
>   -> step 2) access rq before clearing rq mapping
>   blk_mq_clear_rq_mapping(set, tags, hctx_idx);
>   __free_pages() -> rq is freed here
> 
> 4) Then, nbd continue to use the freed request in nbd_read_stat()
> 
> Changes in v8:
>  - add patch 5 to this series.
>  - modify some words.
> Changes in v7:
>  - instead of exposing blk_queue_exit(), using percpu_ref_put()
>  directly.
>  - drop the ref right after nbd_handle_reply().
> Changes in v6:
>  - don't set cmd->status to error if request is completed before
>  nbd_clear_req().
>  - get 'q_usage_counter' to prevent accessing freed request through
>  blk_mq_tag_to_rq(), instead of using blk_mq_find_and_get_req().
> Changes in v5:
>  - move patch 1 & 2 in v4 (patch 4 & 5 in v5) behind
>  - add some comment in patch 5
> Changes in v4:
>  - change the name of the patchset, since uaf is not the only problem
>  if server send unexpected reply message.
>  - instead of adding new interface, use blk_mq_find_and_get_req().
>  - add patch 5 to this series
> Changes in v3:
>  - v2 can't fix the problem thoroughly, add patch 3-4 to this series.
>  - modify descriptions.
>  - patch 5 is just a cleanup
> Changes in v2:
>  - as Bart suggested, add a new helper function for drivers to get
>  request by tag.
> 

You can add

Reviewed-by: Josef Bacik <josef@toxicpanda.com>

to the series.  Sorry Jens, this one slipped through the cracks.  Thanks,

Josef

