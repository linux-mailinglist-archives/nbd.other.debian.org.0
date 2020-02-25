Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D06816BA0F
	for <lists+nbd@lfdr.de>; Tue, 25 Feb 2020 07:48:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 21BC7202D6; Tue, 25 Feb 2020 06:48:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Feb 25 06:48:08 2020
Old-Return-Path: <mchristi@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=4.0 tests=DIGITS_LETTERS,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 39D0B205A1
	for <lists-other-nbd@bendel.debian.org>; Tue, 25 Feb 2020 06:32:30 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.181 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id ULO_R46FCRFa for <lists-other-nbd@bendel.debian.org>;
	Tue, 25 Feb 2020 06:32:25 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by bendel.debian.org (Postfix) with ESMTP id BDD45205E0
	for <nbd@other.debian.org>; Tue, 25 Feb 2020 06:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582612340;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Eroig7D6vFEeaOGUxUXLrHwiaYEEbMGludUh5+B1tSI=;
	b=Rj+x+g1nf+qqOrW49xyUSWYUjU51HPdzP2U7nDKf5X1mlXUdTJpebUwT4IV+u+gFZ3aFoU
	0jkeP7CJS8QA5lqCl4FCjcxrQf7qy5DMn3SCVE3/lfkuOkJuh7nOiwc1O9BmtSQrNPgRsG
	smvlmx1956DM1U0xEWuQylPdp9L3HAg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-292-AzZP0QjNPPOpJYpRHPhvfw-1; Tue, 25 Feb 2020 01:32:15 -0500
X-MC-Unique: AzZP0QjNPPOpJYpRHPhvfw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9B56D8010CA;
	Tue, 25 Feb 2020 06:32:14 +0000 (UTC)
Received: from [10.10.124.80] (ovpn-124-80.rdu2.redhat.com [10.10.124.80])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 96A681D6;
	Tue, 25 Feb 2020 06:32:13 +0000 (UTC)
Subject: Re: [PATCH 1/2] nbd: enable replace socket if only one connection is
 configured
To: Hou Pu <houpu.main@gmail.com>, josef@toxicpanda.com, axboe@kernel.dk
References: <20200219063107.25550-1-houpu@bytedance.com>
 <20200219063107.25550-2-houpu@bytedance.com>
Cc: linux-block@vger.kernel.org, nbd@other.debian.org,
 Hou Pu <houpu@bytedance.com>
From: Mike Christie <mchristi@redhat.com>
Message-ID: <5E54BF6C.4060309@redhat.com>
Date: Tue, 25 Feb 2020 00:32:12 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <20200219063107.25550-2-houpu@bytedance.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <q1HM-8b-bjC.A.59.oMMVeB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/832
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/5E54BF6C.4060309@redhat.com
Resent-Date: Tue, 25 Feb 2020 06:48:09 +0000 (UTC)

On 02/19/2020 12:31 AM, Hou Pu wrote:
> Nbd server with multiple connections could be upgraded since
> 560bc4b (nbd: handle dead connections). But if only one conncection
> is configured, after we take down nbd server, all inflight IO
> would finally timeout and return error. We could requeue them
> like what we do with multiple connections and wait for new socket
> in submit path.
> 
> Signed-off-by: Hou Pu <houpu@bytedance.com>
> ---
>  drivers/block/nbd.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
> index 78181908f0df..8e348c9c49a4 100644
> --- a/drivers/block/nbd.c
> +++ b/drivers/block/nbd.c
> @@ -395,16 +395,19 @@ static enum blk_eh_timer_return nbd_xmit_timeout(struct request *req,
>  	}
>  	config = nbd->config;
>  
> -	if (config->num_connections > 1) {
> +	if (config->num_connections > 1 ||
> +	    (config->num_connections == 1 && nbd->tag_set.timeout)) {
>  		dev_err_ratelimited(nbd_to_dev(nbd),
>  				    "Connection timed out, retrying (%d/%d alive)\n",
>  				    atomic_read(&config->live_connections),
>  				    config->num_connections);
>  		/*
>  		 * Hooray we have more connections, requeue this IO, the submit
> -		 * path will put it on a real connection.
> +		 * path will put it on a real connection. Or if only one
> +		 * connection is configured, the submit path will wait util
> +		 * a new connection is reconfigured or util dead timeout.
>  		 */
> -		if (config->socks && config->num_connections > 1) {
> +		if (config->socks) {
>  			if (cmd->index < config->num_connections) {
>  				struct nbd_sock *nsock =
>  					config->socks[cmd->index];
> @@ -747,8 +750,7 @@ static struct nbd_cmd *nbd_read_stat(struct nbd_device *nbd, int index)
>  				 * and let the timeout stuff handle resubmitting
>  				 * this request onto another connection.
>  				 */
> -				if (nbd_disconnected(config) ||
> -				    config->num_connections <= 1) {
> +				if (nbd_disconnected(config)) {

I think you need to update the comment right above this chunk. It still
mentions num_connections=1 working differently.


>  					cmd->status = BLK_STS_IOERR;
>  					goto out;
>  				}
> @@ -825,7 +827,7 @@ static int find_fallback(struct nbd_device *nbd, int index)
>  
>  	if (config->num_connections <= 1) {
>  		dev_err_ratelimited(disk_to_dev(nbd->disk),
> -				    "Attempted send on invalid socket\n");
> +				    "Dead connection, failed to find a fallback\n");
>  		return new_index;
>  	}
>  
> 

