Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id A64CA16C3D6
	for <lists+nbd@lfdr.de>; Tue, 25 Feb 2020 15:27:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 5FAA120577; Tue, 25 Feb 2020 14:27:08 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Feb 25 14:27:08 2020
Old-Return-Path: <houpu.main@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id A228C204F5
	for <lists-other-nbd@bendel.debian.org>; Tue, 25 Feb 2020 14:11:09 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.179 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	FREEMAIL_FROM=0.001, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id O2AngvhiJajl for <lists-other-nbd@bendel.debian.org>;
	Tue, 25 Feb 2020 14:11:05 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com [IPv6:2607:f8b0:4864:20::d41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 7E33020390
	for <nbd@other.debian.org>; Tue, 25 Feb 2020 14:11:05 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id w9so1586819iob.12
        for <nbd@other.debian.org>; Tue, 25 Feb 2020 06:11:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kuyjphlA2CCveQ0MZg02qKZPdw8Avu4nSPzT/upFgrc=;
        b=g2cXQFv76MfCdlYpVLFP6jtndRlWTSDK3TNUVgQdXgBpfcsfynuC49Ke74FtjMjWUa
         kH449V60JUqdnjOfQWnK3/dLTFIT3RHevYNkRllK1SrGCLTU+Q0pejeS3YtYoF7ZrO72
         GP9B7oMUpvkC16sdSik/eLJfw5VrpDzM3wemDYbUKzk9ze2Sww5aR+d/O2CWpeSWA104
         xmL1GbSinyQnXDCkjVdrAK9FsNx+Fn/hetiL60bAmXnv38W1Nm+YKFwo++0HTEYb70e0
         iL1DTSikMS6Bu9QtboDb1aJvH+FkdAN7v35rews0aaIt4epbL6LVI8es/wGGdxgeFNHg
         4emg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kuyjphlA2CCveQ0MZg02qKZPdw8Avu4nSPzT/upFgrc=;
        b=jolYj1xFT0IV4yL22KtP1GohBJzFj6k6E5e6l/tm8YyBpXBD7evAAtrW2fUZjcWrdJ
         cns9L4pIKafU7xbo6ZxxmxyYYVUag90omvNpVzO0C8c7UIuzTmhDBscftbcZRpG8TQTv
         cdio2xzU67qBlooiAIZPMS327rlXXS2Fccn78yRWpc/GJD6N8rgME5yjfiFBmCB9mTmi
         Z5mflqzJ94jRqpkVbywTwO6U3o/k7m6kNlMaEfJ8Z5XFv3KQk9KO6zUqY3ZW5Q/XnQbS
         wbYWBhytyQmVI/cjOafWzt8ktQcgVlAFsWDCM5FI1Gx90r88f3yYSloX2eoMhBjQFH8A
         ya+A==
X-Gm-Message-State: APjAAAWH8sr4shrOpaC+sFBdeOjcPgttnfgGJaEbyAurP2MCngPziRGN
	BK+6C0GwgNUOBDaQ5FNB6TjKzXjYZgbT+g6bDro=
X-Google-Smtp-Source: APXvYqyE7nlNBsyMe5ZIk4iCBnFH6h/vMwzeXCRYqgJHj28uhP3bmb39oYwp6byFOUt4J/WDFPoc8WDaLAl+3Kktiu0=
X-Received: by 2002:a6b:6b0e:: with SMTP id g14mr60619351ioc.71.1582639862067;
 Tue, 25 Feb 2020 06:11:02 -0800 (PST)
MIME-Version: 1.0
References: <20200219063107.25550-1-houpu@bytedance.com> <20200219063107.25550-2-houpu@bytedance.com>
 <5E54BF6C.4060309@redhat.com>
In-Reply-To: <5E54BF6C.4060309@redhat.com>
From: Hou Pu <houpu.main@gmail.com>
Date: Tue, 25 Feb 2020 22:10:50 +0800
Message-ID: <CAKHcvQi=tHWkkMj=doPPf_kwCURvmumJdQNSWjwnsMo7vVREVg@mail.gmail.com>
Subject: Re: [PATCH 1/2] nbd: enable replace socket if only one connection is configured
To: Mike Christie <mchristi@redhat.com>
Cc: Josef Bacik <josef@toxicpanda.com>, axboe@kernel.dk, linux-block@vger.kernel.org, 
	nbd@other.debian.org, Hou Pu <houpu@bytedance.com>
Content-Type: text/plain; charset="UTF-8"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <NjQNxN9H-xN.A.ZBB.86SVeB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/833
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CAKHcvQi=tHWkkMj=doPPf_kwCURvmumJdQNSWjwnsMo7vVREVg@mail.gmail.com
Resent-Date: Tue, 25 Feb 2020 14:27:08 +0000 (UTC)

On Tue, Feb 25, 2020 at 2:32 PM Mike Christie <mchristi@redhat.com> wrote:
>
> On 02/19/2020 12:31 AM, Hou Pu wrote:
> > Nbd server with multiple connections could be upgraded since
> > 560bc4b (nbd: handle dead connections). But if only one conncection
> > is configured, after we take down nbd server, all inflight IO
> > would finally timeout and return error. We could requeue them
> > like what we do with multiple connections and wait for new socket
> > in submit path.
> >
> > Signed-off-by: Hou Pu <houpu@bytedance.com>
> > ---
> >  drivers/block/nbd.c | 14 ++++++++------
> >  1 file changed, 8 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
> > index 78181908f0df..8e348c9c49a4 100644
> > --- a/drivers/block/nbd.c
> > +++ b/drivers/block/nbd.c
> > @@ -395,16 +395,19 @@ static enum blk_eh_timer_return nbd_xmit_timeout(struct request *req,
> >       }
> >       config = nbd->config;
> >
> > -     if (config->num_connections > 1) {
> > +     if (config->num_connections > 1 ||
> > +         (config->num_connections == 1 && nbd->tag_set.timeout)) {
> >               dev_err_ratelimited(nbd_to_dev(nbd),
> >                                   "Connection timed out, retrying (%d/%d alive)\n",
> >                                   atomic_read(&config->live_connections),
> >                                   config->num_connections);
> >               /*
> >                * Hooray we have more connections, requeue this IO, the submit
> > -              * path will put it on a real connection.
> > +              * path will put it on a real connection. Or if only one
> > +              * connection is configured, the submit path will wait util
> > +              * a new connection is reconfigured or util dead timeout.
> >                */
> > -             if (config->socks && config->num_connections > 1) {
> > +             if (config->socks) {
> >                       if (cmd->index < config->num_connections) {
> >                               struct nbd_sock *nsock =
> >                                       config->socks[cmd->index];
> > @@ -747,8 +750,7 @@ static struct nbd_cmd *nbd_read_stat(struct nbd_device *nbd, int index)
> >                                * and let the timeout stuff handle resubmitting
> >                                * this request onto another connection.
> >                                */
> > -                             if (nbd_disconnected(config) ||
> > -                                 config->num_connections <= 1) {
> > +                             if (nbd_disconnected(config)) {
>
> I think you need to update the comment right above this chunk. It still
> mentions num_connections=1 working differently.

Thanks. Will change the comment in v2.

>
>
> >                                       cmd->status = BLK_STS_IOERR;
> >                                       goto out;
> >                               }
> > @@ -825,7 +827,7 @@ static int find_fallback(struct nbd_device *nbd, int index)
> >
> >       if (config->num_connections <= 1) {
> >               dev_err_ratelimited(disk_to_dev(nbd->disk),
> > -                                 "Attempted send on invalid socket\n");
> > +                                 "Dead connection, failed to find a fallback\n");
> >               return new_index;
> >       }
> >
> >
>

