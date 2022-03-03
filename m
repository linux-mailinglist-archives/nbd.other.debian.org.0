Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A034CBA5F
	for <lists+nbd@lfdr.de>; Thu,  3 Mar 2022 10:35:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 1604C20EDC; Thu,  3 Mar 2022 09:35:13 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Mar  3 09:35:13 2022
Old-Return-Path: <w@uter.be>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,LDOSUBSCRIBER,
	LDO_WHITELIST,MURPHY_DRUGS_REL8,T_SCC_BODY_TEXT_LINE,
	WORD_WITHOUT_VOWELS autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id E459D20EDA
	for <lists-other-nbd@bendel.debian.org>; Thu,  3 Mar 2022 09:35:03 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-5.09 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02, T_SCC_BODY_TEXT_LINE=-0.01,
	WORD_WITHOUT_VOWELS=1] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 6T_1DujEXtI5 for <lists-other-nbd@bendel.debian.org>;
	Thu,  3 Mar 2022 09:34:58 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_FROM_MX=-3.1; rate: -4.6
Received: from lounge.grep.be (lounge.grep.be [IPv6:2a01:4f8:200:91e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 3574D20EDB
	for <nbd@other.debian.org>; Thu,  3 Mar 2022 09:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=uter.be;
	s=2021.lounge; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=TaI64qVCUHzYMPhWACDT6vKPi0XVWdiLzi/va41Dd08=; b=agCJRkJ+fpi1xPSLrFT12PTY8m
	trD1YPm6w9ancgaXZkrJaLaChFZpw3LYSlD9zJF4EErVXheD3LZkwWhqYdVEKu/QRzcnWRvF7v0+A
	mSgv1e65/NccjhU4ikiVlM2sOOP4dmXG88Y95sO3ZYdNC1w6mGW1CP2gVt2ugX1oSz+Yro0mKZI9U
	8o5bhlKkZQRrIA6HjKBwAAXNXhCj7cw7VkTQOKF+1OMx74myQj6wzXCsXJTh48n4d0wZgyyiMDp3L
	yxSXY1alyPiTZLKMhBEHx39FE0z7kwfVhWbrlQRNqlwygj1Pi6m1SmKEUwzjM6j/v167F2aCVHwa2
	lPjXEnJg==;
Received: from [196.251.239.242] (helo=pc181009)
	by lounge.grep.be with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <w@uter.be>)
	id 1nPhrJ-005h3g-2v; Thu, 03 Mar 2022 10:34:53 +0100
Received: from wouter by pc181009 with local (Exim 4.95)
	(envelope-from <w@uter.be>)
	id 1nPhrD-000AcB-7t;
	Thu, 03 Mar 2022 11:34:47 +0200
Date: Thu, 3 Mar 2022 11:34:47 +0200
From: Wouter Verhelst <w@uter.be>
To: Manfred Spraul <manfred@colorfullife.com>
Cc: nbd@other.debian.org, Eric Blake <eblake@redhat.com>,
	Manfred Spraul <manfred.spraul@de.bosch.com>
Subject: Re: [PATCH 2/9] nbd-server, nbd-trdump: Add support for logging
 actual data
Message-ID: <YiCLt2SL/Dc4f4Mt@pc181009.grep.be>
References: <20220121175711.5083-1-manfred@colorfullife.com>
 <20220121175711.5083-3-manfred@colorfullife.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220121175711.5083-3-manfred@colorfullife.com>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <H37p7uJrN3B.A.SPB.RvIIiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1718
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/YiCLt2SL/Dc4f4Mt@pc181009.grep.be
Resent-Date: Thu,  3 Mar 2022 09:35:13 +0000 (UTC)

On Fri, Jan 21, 2022 at 06:57:04PM +0100, Manfred Spraul wrote:
> From: Manfred Spraul <manfred.spraul@de.bosch.com>
> 
> The datalog generated by nbd-server contains only the requests
> received by the server, not the actual data to be written.
> 
> This patch adds support to write the actual data.
> 
> As details:
> - It is configurable, the default behavior is not changed.
> - It defines a new magic that is only used for the log file, and uses
>   an entry with that magic to store the information that the actual
>   data is stored in the trace file.
> - It is an incompatible change: Current nbd-trdump utilities will
>   just fail/produce bad output when called with a new log file,
>   without a proper error message.
> - nbd-trdump supports to dump also the messages sent by the
>   server. Unfortunately, the current server does not log
>   the sent messages. This change does not fix this.
> 
> Open:
> Should nbd-trdump abort when it sees an unknown new log config
> option? Right now, it is only printed out as "UNKNOWN", but the
> tool tries to continue anyways.

It might make sense to issue a warning in that case? Something along the
lines of:

"WARNING: unknown option found in log file. Will try to parse the log file, but
this may fail. You have been warned!"

> Known bugs:
> Locking is missing. If multiple clients connect, then the data log
> will be unusable.

Since this is mainly a debugging tool, I don't think that's a problem.

> Plan: Use a named posix semaphore (sem_open()).
> Given the multi-process, multi-thread model, with a single fd shared
> by everyone, this is probably simpler than trying to find a reliable
> flock()/fcntl()/pthread_mutex_lock() combination.
> Alternative: shm_open()+a shared pthread_mutex.

This feels like overkill to me.

We might want a mutex just so that multiple writes handled on multiple
threads don't corrupt the file (I don't know whether that's the case
currently), but beyond that I don't think it's worth the extra effort.

> Signed-off-by: Manfred Spraul <manfred.spraul@de.bosch.com>
> ---
>  nbd-helper.h | 31 +++++++++++++++++++++++
>  nbd-server.c | 70 ++++++++++++++++++++++++++++++++++++++++++++--------
>  nbd-trdump.c | 46 ++++++++++++++++++++++++++++++++++
>  nbd.h        |  4 +++
>  nbdsrv.h     |  1 +
>  5 files changed, 142 insertions(+), 10 deletions(-)
> 
> diff --git a/nbd-helper.h b/nbd-helper.h
> index 86ac1c2..65f16bb 100644
> --- a/nbd-helper.h
> +++ b/nbd-helper.h
> @@ -3,6 +3,22 @@
>  
>  #include "nbd.h"
>  
> +/* Constants and macros */
> +
> +/*
> + * Constants for nbd_request.magic == NBD_TRACELOG_MAGIC
> + */
> +/* 1) stored in nbd_req.type */
> +enum {
> +	/* enable/disable logging actual data.
> +	 * nbd_request.len is the new value (true/false)
> +	 */
> +	NBD_TRACELOG_SET_DATALOG = 1
> +};
> +
> +/* 2) Must be in nbd_req.from */
> +#define NBD_TRACELOG_FROM_MAGIC	0x4A93BA39A54F31B6ULL

OOI: how was this one chosen?

> +
>  /* Functions */
>  
>  /**
> @@ -27,6 +43,21 @@ static inline const char * getcommandname(uint32_t command) {
>  		return "UNKNOWN";
>  	}
>  }
> +
> +/**
> + * Translate a tracelog parameter name into human readable form
> + *
> + * @type tracelog parameter number from struct nbd_req.type
> + * @return pointer to the name
> + **/
> +static inline const char * gettracelogname(uint32_t type) {
> +	switch (type) {
> +	ENUM2STR(NBD_TRACELOG_SET_DATALOG);
> +	default:
> +		return "UNKNOWN";
> +	}
> +}
> +
>  #undef ENUM2STR
>  
>  #endif //NBD_HELPER_H
> diff --git a/nbd-server.c b/nbd-server.c
> index 3c3589e..dbb4e74 100644
> --- a/nbd-server.c
> +++ b/nbd-server.c
> @@ -786,6 +786,7 @@ GArray* parse_cfile(gchar* f, struct generic_conf *const genconf, bool expect_ge
>  		{ "rotational",	FALSE,  PARAM_BOOL,	&(s.flags),		F_ROTATIONAL },
>  		{ "temporary",	FALSE,  PARAM_BOOL,	&(s.flags),		F_TEMPORARY },
>  		{ "trim",	FALSE,  PARAM_BOOL,	&(s.flags),		F_TRIM },
> +		{ "datalog",	FALSE,  PARAM_BOOL,	&(s.flags),		F_DATALOG },
>  		{ "listenaddr", FALSE,  PARAM_STRING,   &(s.listenaddr),	0 },
>  		{ "maxconnections", FALSE, PARAM_INT,	&(s.max_connections),	0 },
>  		{ "force_tls",	FALSE,	PARAM_BOOL,	&(s.flags),		F_FORCEDTLS },
> @@ -982,6 +983,15 @@ GArray* parse_cfile(gchar* f, struct generic_conf *const genconf, bool expect_ge
>  			g_key_file_free(cfile);
>  			return NULL;
>  		}
> +		/* We can't mix datalog and splice. */
> +		if ((s.flags & F_DATALOG) && (s.flags & F_SPLICE)) {
> +			g_set_error(e, NBDS_ERR, NBDS_ERR_CFILE_INVALID_SPLICE,
> +				    "Cannot mix datalog with splice for an export in group %s",
> +				    groups[i]);
> +			g_array_free(retval, TRUE);
> +			g_key_file_free(cfile);
> +			return NULL;
> +		}
>  		/* Don't need to free this, it's not our string */
>  		virtstyle=NULL;
>  		/* Don't append values for the [generic] group */
> @@ -1980,6 +1990,49 @@ void send_export_info(CLIENT* client, SERVER* server, bool maybe_zeroes) {
>  	}
>  }
>  
> +/**
> +  * Setup the transaction log
> +  *
> +  * The function does all things required for the transaction log:
> +  * - Create a new log file.
> +  * - Report if a log file already exists.
> +  * - If needed add a header to the log.
> +  *
> +  * If something goes wrong, logging is disabled.
> +  *
> +  * @param client the CLIENT structure with .server and .net members set
> +  * up correctly
> +  */
> +static void setup_transactionlog(CLIENT *client) {
> +
> +	if((client->transactionlogfd =
> +				open(client->server->transactionlog,
> +					O_WRONLY | O_CREAT,
> +					S_IRUSR | S_IWUSR)) ==
> +			-1) {
> +		msg(LOG_INFO, "Could not open transactionlog %s, moving on without it",
> +				client->server->transactionlog);
> +	}
> +	if (client->server->flags & F_DATALOG) {
> +		struct nbd_request req;
> +		int ret;
> +
> +		req.magic = htonl(NBD_TRACELOG_MAGIC);
> +		req.type = htonl(NBD_TRACELOG_SET_DATALOG);
> +		memset(req.handle, 0, sizeof(req.handle));
> +		req.from = htonll(NBD_TRACELOG_FROM_MAGIC);
> +		req.len = htonl(TRUE);
> +
> +		ret = writeit(client->transactionlogfd, &req, sizeof(struct nbd_request));
> +		if (ret < 0) {
> +			msg(LOG_INFO, "Could not write to transactionlog %s, moving on without it",
> +				client->server->transactionlog);
> +			close(client->transactionlogfd);
> +			client->transactionlogfd = -1;
> +		}
> +	}
> +}
> +
>  /**
>    * Commit to exporting the chosen export
>    *
> @@ -2043,16 +2096,8 @@ static bool commit_client(CLIENT* client, SERVER* server) {
>          }
>  
>  	/* Set up the transactionlog, if we need one */
> -	if (client->server->transactionlog && (client->transactionlogfd == -1)) {
> -		if((client->transactionlogfd =
> -					open(client->server->transactionlog,
> -						O_WRONLY | O_CREAT,
> -						S_IRUSR | S_IWUSR)) ==
> -				-1) {
> -			msg(LOG_INFO, "Could not open transactionlog %s, moving on without it",
> -					client->server->transactionlog);
> -		}
> -	}
> +	if (client->server->transactionlog && (client->transactionlogfd == -1))
> +		setup_transactionlog(client);
>  
>  	/* Run any pre scripts that we may need */
>  	if (do_run(client->server->prerun, client->exportname)) {
> @@ -2786,6 +2831,11 @@ static int mainloop_threaded(CLIENT* client) {
>  			else
>  #endif
>  				socket_read(client, pkg->data, req->len);
> +
> +			if ((client->server->flags & F_DATALOG) &&
> +					!(client->server->flags & F_SPLICE)) {
> +				writeit(client->transactionlogfd, pkg->data, req->len);
> +			}
>  		}
>  		if(req->type == NBD_CMD_DISC) {
>  			finalize_client(client);
> diff --git a/nbd-trdump.c b/nbd-trdump.c
> index d9c2ae5..d914e63 100644
> --- a/nbd-trdump.c
> +++ b/nbd-trdump.c
> @@ -11,6 +11,7 @@
>  #include <sys/time.h>
>  #include <sys/types.h>
>  #include <stdint.h>
> +#include <stdbool.h>
>  #include <unistd.h>
>  #include "config.h"
>  /* We don't want to do syslog output in this program */
> @@ -19,6 +20,11 @@
>  #include "nbd.h"
>  #include "nbd-helper.h"
>  
> +#define BUFSIZE	131072
> +static char tmpbuf[BUFSIZE];
> +
> +static bool g_with_datalog = false;
> +
>  static inline void doread(int f, void *buf, size_t len) {
>          ssize_t res;
>  
> @@ -78,6 +84,17 @@ int main(int argc, char**argv) {
>  			       (command & NBD_CMD_FLAG_FUA)?"FUA":"NONE",
>  			       (long long unsigned int) offset,
>  			       len);
> +			if (((command & NBD_CMD_MASK_COMMAND) == NBD_CMD_WRITE) &&
> +					g_with_datalog) {
> +				while (len > 0) {
> +					uint32_t tmplen = len;
> +
> +					if (tmplen > BUFSIZE)
> +						tmplen = BUFSIZE;
> +					doread(readfd, tmpbuf, tmplen);
> +					len -= tmplen;
> +				}
> +			}
>  			
>  			break;
>  		case NBD_REPLY_MAGIC:
> @@ -90,6 +107,35 @@ int main(int argc, char**argv) {
>  			       error);
>  			break;
>  			
> +		case NBD_TRACELOG_MAGIC:
> +			doread(readfd, sizeof(magic)+(char *)(&req), sizeof(struct nbd_request)-sizeof(magic));
> +			handle = ntohll(*((long long int *)(req.handle)));
> +			offset = ntohll(req.from);
> +			len = ntohl(req.len);
> +			command = ntohl(req.type);
> +
> +			ctext = gettracelogname(command);
> +
> +			printf("TRACE_OPTION C=0x%08x (%23s) O=%016llx L=%08x\n",
> +			       command,
> +			       ctext,
> +			       (long long unsigned int) offset,
> +			       len);
> +			if (offset == NBD_TRACELOG_FROM_MAGIC) {
> +
> +				switch (command) {
> +				case NBD_TRACELOG_SET_DATALOG:
> +					g_with_datalog = !!len;
> +					printf("TRACE_OPTION DATALOG set to %d.\n", (int)g_with_datalog);
> +					break;
> +				default:
> +					printf("TRACE_OPTION ? Unknown type\n");
> +				}
> +			} else {
> +				printf("TRACE_OPTION ? Unknown FROM_MAGIC\n");
> +			}
> +			break;
> +
>  		default:
>  			printf("? Unknown transaction type %08x\n",magic);
>  			break;
> diff --git a/nbd.h b/nbd.h
> index 1e57b3e..31462aa 100644
> --- a/nbd.h
> +++ b/nbd.h
> @@ -64,6 +64,10 @@ enum {
>  
>  #define NBD_REQUEST_MAGIC 0x25609513
>  #define NBD_REPLY_MAGIC 0x67446698
> +#define NBD_STRUCTURED_REPLY_MAGIC 0x668e33ef
> +
> +/* for the trace log, not part of the protocol, not sent over the wire */
> +#define NBD_TRACELOG_MAGIC 0x25609514
>  /* Do *not* use magics: 0x12560953 0x96744668. */
>  
>  #define NBD_OPT_REPLY_MAGIC 0x3e889045565a9LL
> diff --git a/nbdsrv.h b/nbdsrv.h
> index 6a20c9b..b84e26a 100644
> --- a/nbdsrv.h
> +++ b/nbdsrv.h
> @@ -155,6 +155,7 @@ typedef enum {
>  #define F_FORCEDTLS 16384 /**< TLS is required, either for the server as a whole or for a given export */
>  #define F_SPLICE 32768	  /**< flag to tell us to use splice for read/write operations */
>  #define F_WAIT 65536      /**< flag to tell us to wait for file creation */
> +#define F_DATALOG 131072  /**< flag to tell us that the transaction log shall contain the written data */
>  
>  /* Functions */
>  
> -- 
> 2.34.1
> 
> 

-- 
     w@uter.{be,co.za}
wouter@{grep.be,fosdem.org,debian.org}

